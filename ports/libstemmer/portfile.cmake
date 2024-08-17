vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_download_distfile(ARCHIVE
    URLS "https://snowballstem.org/dist/libstemmer_c-${VERSION}.tar.gz"
    FILENAME "libstemmer_c-${VERSION}.tar.gz"
    SHA512 a61a06a046a6a5e9ada12310653c71afb27b5833fa9e21992ba4bdf615255de991352186a8736d0156ed754248a0ffb7b7712e8d5ea16f75174d1c8ddd37ba4a
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS_DEBUG -DDISABLE_INSTALL_HEADERS=ON
)

vcpkg_cmake_install()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
