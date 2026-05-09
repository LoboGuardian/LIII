# Plan

One commit per change, short lowercase subject.

## Phase 1 — Build system low-hanging fruit

1. `add ccache to root CMakeLists.txt`
2. `bump cmake_minimum_required to 3.16`
3. `remove redundant cmake_minimum_required from subdirs`
4. `remove ALL from doxygen target`
5. `remove Subversion code from VersionConf.cmake`

## Phase 2 — CMake modernization

6. `replace add_definitions with target_compile_definitions`
7. `replace include_directories with target_include_directories`
8. `switch static library to object library`
9. `remove hardcoded -std=c++11 from projecthelper.cmake`

## Phase 3 — Dead code

10. `remove customutf8codec`
11. `remove Qt4 compat branches from qtsingleapplication`
12. `compile qtlockedfile separately instead of #include'd`
13. `remove unused forwarder headers from qtsingleapplication`

## Phase 4 — API modernization

14. `replace QRegExp with QRegularExpression in utilities` ✓
15. `replace QRegExp with QRegularExpression in gui` ✓
16. `replace QRegExp with QRegularExpression in logic` ✓
17. `replace QString::SkipEmptyParts with Qt::SkipEmptyParts` ✓
18. `replace SIGNAL/SLOT macros with pointer-to-member syntax` ✓
19. `replace foreach with range-based for` ✓

## Phase 5 — Vendored libtorrent

20. `strip unused files from vendored libtorrent`
21. `find and link system libtorrent-rasterbar on Linux`
22. `clean up cmake FindTorrentRasterbar module`

## Phase 6 — CI

23. `run tests in Linux CI on every push` ✓
24. `add macOS CI workflow` ✓
25. `cache Boost builds in Windows CI` ✓
26. `trigger Windows CI on push too` ✓

## Phase 7 — Packaging

27. `add DEB to CPack generators` ✓
28. `update .gitignore` ✓
