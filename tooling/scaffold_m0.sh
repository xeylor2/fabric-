#!/usr/bin/env bash
# FEBRIC M0 scaffold generator — creates the 25 architecture packages and the
# workspace root pubspec exactly as specified by Architecture V2 (docs/architecture).
# One-time initialization tool; kept for provenance and re-runs are idempotent.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
SDK='^3.12.0'

camel() {
  local IFS='_' out='' p
  for p in $1; do out+="${p^}"; done
  printf '%s' "$out"
}

# name|type(dart|flutter)|internal deps (comma)|lib/src subfolders (comma)|description (no quotes/pipes)
ENTRIES=(
  "core_common|dart||result,errors,logging,ledger,utils|Shared kernel: result types, error model, logging, activity ledger, pure utilities."
  "core_document|dart|core_common|tree,nodes,addressing,commands,versioning,serialization|Design Tree document engine: typed nodes, semantic addressing, command bus, undo, versioning, .febric serialization."
  "core_garment|dart|core_common,core_document|schema,parts,templates,packs,instantiate|Garment Structure and Library engines: schemas, part definitions, templates, content packs, instantiation."
  "core_color|dart|core_common|palette,colorway,icc,gamut|Color engine: palettes, colorways, ICC/CMYK transforms, gamut and delta-E analysis."
  "core_ai|dart|core_common|jobs,providers,staging,credits,conversation,inspection,api_manager|AI engine: job model, provider abstraction, API Manager, proposal staging, conversation and inspection pipelines."
  "core_assets|dart|core_common,core_ai|model,index,recommend|Asset Intelligence engine: asset model, embedding index client, recommendation services."
  "core_imaging|flutter|core_common|raster,masks,color,isolates,ffi|Imaging engine: raster operations, masks, compositing, isolate execution, FFI seam."
  "core_rendering|flutter|core_common,core_document|engine,tiles,hit_testing,preview|Rendering engine: Design Tree render-graph compiler, tiled canvas, hit testing, previews."
  "core_design_system|flutter|core_common|tokens,themes,density,components|Design system and Theme Engine: tokens, themes, density modes, FEBRIC UI kit."
  "core_workspace|flutter|core_common,core_design_system|docking,shortcuts,menus,palette|Desktop workspace engine: dockable layouts, shortcut registry, context menus, command palette."
  "core_production|flutter|core_common,core_document,core_color,core_rendering|preflight,render,encode,package|Production engine: preflight rules, production rendering, encoders, packaging."
  "feature_dashboard|flutter|core_common,core_ai,core_assets,core_design_system|domain,data,presentation|Project Dashboard: recents, pinned projects, activity, system health."
  "feature_design_tree|flutter|core_common,core_document,core_workspace,core_design_system|domain,data,presentation|Design Tree panel: node operations, locks, versions, tree navigation."
  "feature_garment_library|flutter|core_common,core_garment,core_document,core_design_system|domain,data,presentation|Garment Library: template browsing, taxonomy filters, instantiation."
  "feature_canvas_editor|flutter|core_common,core_document,core_rendering,core_imaging,core_design_system|domain,data,presentation|Canvas editor: workspace tools, selection, transforms."
  "feature_inspector|flutter|core_common,core_ai,core_imaging,core_document,core_design_system|domain,data,presentation|Textile Inspector: artwork analysis, staged tree population, refinement."
  "feature_conversation|flutter|core_common,core_ai,core_document,core_design_system|domain,data,presentation|Conversation AI surface: intent, target, constraint, plan, preview, approval."
  "feature_ai_assist|flutter|core_common,core_ai,core_document,core_design_system|domain,data,presentation|Scoped AI assistance: generate, modify, replace, recolor flows with staging."
  "feature_repeat|flutter|core_common,core_document,core_rendering,core_design_system|domain,data,presentation|Repeat feature: repeat configuration, tiled preview, seam tools."
  "feature_color|flutter|core_common,core_color,core_document,core_design_system|domain,data,presentation|Color feature: palettes, element-aware recolor, colorway manager."
  "feature_library|flutter|core_common,core_assets,core_design_system|domain,data,presentation|Asset library: motifs, borders, palettes, recommendation rails."
  "feature_projects|flutter|core_common,core_document,core_design_system|domain,data,presentation|Projects: browser, versions, import and export."
  "feature_production|flutter|core_common,core_production,core_color,core_rendering,core_design_system|domain,data,presentation|Production surface: preflight UI, exports, factory preview."
  "feature_review|flutter|core_common,core_document,core_design_system|domain,data,presentation|Review companion: annotate, approve, colorway sign-off."
  "feature_settings|flutter|core_common,core_ai,core_design_system|domain,data,presentation|Settings: Theme Engine controls, API Manager, preferences."
)

mkdir -p packages

for entry in "${ENTRIES[@]}"; do
  IFS='|' read -r name type deps subdirs desc <<<"$entry"
  dir="packages/$name"
  CAMEL="$(camel "$name")"
  mkdir -p "$dir/lib/src" "$dir/test"

  # ---- pubspec.yaml -------------------------------------------------------
  {
    echo "name: $name"
    echo "description: \"FEBRIC $desc\""
    echo "version: 0.1.0"
    echo "publish_to: none"
    echo "resolution: workspace"
    echo ""
    echo "environment:"
    echo "  sdk: $SDK"
    if [ "$type" = "flutter" ] || [ -n "$deps" ]; then
      echo ""
      echo "dependencies:"
      if [ "$type" = "flutter" ]; then
        echo "  flutter:"
        echo "    sdk: flutter"
      fi
      if [ -n "$deps" ]; then
        IFS=',' read -ra DEP_LIST <<<"$deps"
        for d in "${DEP_LIST[@]}"; do
          echo "  $d:"
          echo "    path: ../$d"
        done
      fi
    fi
    echo ""
    echo "dev_dependencies:"
    if [ "$type" = "flutter" ]; then
      echo "  flutter_test:"
      echo "    sdk: flutter"
    else
      echo "  test: ^1.25.0"
    fi
  } > "$dir/pubspec.yaml"

  # ---- analysis_options.yaml ----------------------------------------------
  printf 'include: ../../analysis_options.yaml\n' > "$dir/analysis_options.yaml"

  # ---- README.md ------------------------------------------------------------
  {
    echo "# $name"
    echo ""
    echo "FEBRIC $desc"
    echo ""
    echo "Part of the FEBRIC monorepo. Blueprint: \`docs/architecture/architecture-v2.md\`."
    echo ""
    echo "Status: package skeleton (M0). Implementation lands in its assigned milestone."
  } > "$dir/README.md"

  # ---- barrel ---------------------------------------------------------------
  {
    echo "/// FEBRIC $desc"
    echo "///"
    echo "/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2)."
    echo "library;"
    echo ""
    echo "export 'src/${name}_package.dart';"
  } > "$dir/lib/$name.dart"

  # ---- package marker ---------------------------------------------------------
  {
    echo "/// Package marker for \`$name\`."
    echo "///"
    echo "/// $desc"
    echo "///"
    echo "/// Keeps the package importable and testable from day one; real"
    echo "/// implementation arrives in its architecture milestone."
    echo "abstract final class ${CAMEL}Package {"
    echo "  static const String id = '$name';"
    echo "  static const String description ="
    echo "      '$desc';"
    echo "}"
  } > "$dir/lib/src/${name}_package.dart"

  # ---- blueprint subfolders ---------------------------------------------------
  IFS=',' read -ra SUB_LIST <<<"$subdirs"
  for s in "${SUB_LIST[@]}"; do
    mkdir -p "$dir/lib/src/$s"
    touch "$dir/lib/src/$s/.gitkeep"
  done

  # ---- smoke test ---------------------------------------------------------------
  if [ "$type" = "flutter" ]; then
    test_import="package:flutter_test/flutter_test.dart"
  else
    test_import="package:test/test.dart"
  fi
  {
    echo "import 'package:$name/$name.dart';"
    echo "import '$test_import';"
    echo ""
    echo "void main() {"
    echo "  test('$name package marker is wired', () {"
    echo "    expect(${CAMEL}Package.id, '$name');"
    echo "  });"
    echo "}"
  } > "$dir/test/${name}_test.dart"

  echo "scaffolded: $name ($type)"
done

# ---- workspace root pubspec ------------------------------------------------
{
  echo "name: febric_workspace"
  echo "description: FEBRIC monorepo workspace root (Architecture V2)."
  echo "publish_to: none"
  echo ""
  echo "environment:"
  echo "  sdk: $SDK"
  echo ""
  echo "workspace:"
  echo "  - app"
  for entry in "${ENTRIES[@]}"; do
    IFS='|' read -r name _rest <<<"$entry"
    echo "  - packages/$name"
  done
} > pubspec.yaml

echo "workspace root pubspec written (26 members)."
echo "DONE"
