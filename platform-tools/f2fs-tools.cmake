add_definitions(
    -DF2FS_MAJOR_VERSION=1
    -DF2FS_MINOR_VERSION=13
    -DF2FS_TOOLS_VERSION="1.13.0"
    -DF2FS_TOOLS_DATE="2020-06-05"
    -DWITH_ANDROID
    )

include_directories(
    ${SRC}/f2fs-tools/include
    ${SRC}/e2fsprogs/lib
    ${SRC}/e2fsprogs/lib/uuid
    ${SRC}/lz4/lib
    ${SRC}/system/core/libsparse/include
    )

add_executable(make_f2fs 
    ${SRC}/f2fs-tools/lib/libf2fs.c
    ${SRC}/f2fs-tools/mkfs/f2fs_format.c
    ${SRC}/f2fs-tools/mkfs/f2fs_format_utils.c
    ${SRC}/f2fs-tools/lib/libf2fs_zoned.c
    ${SRC}/f2fs-tools/lib/nls_utf8.c
    ${SRC}/f2fs-tools/lib/libf2fs_io.c
    ${SRC}/f2fs-tools/mkfs/f2fs_format_main.c
    )
target_compile_definitions(make_f2fs PRIVATE -DWITH_BLKDISCARD)
target_link_libraries(make_f2fs
    libext2_uuid
    libbase
    libsparse
    dl
    z
    )
    
add_executable(make_f2fs_casefold 
    ${SRC}/f2fs-tools/lib/libf2fs.c
    ${SRC}/f2fs-tools/mkfs/f2fs_format.c
    ${SRC}/f2fs-tools/mkfs/f2fs_format_utils.c
    ${SRC}/f2fs-tools/lib/libf2fs_zoned.c
    ${SRC}/f2fs-tools/lib/nls_utf8.c
    ${SRC}/f2fs-tools/lib/libf2fs_io.c
    ${SRC}/f2fs-tools/mkfs/f2fs_format_main.c
    )
target_compile_definitions(make_f2fs_casefold PRIVATE 
    -DCONF_CASEFOLD
    -DCONF_PROJID
    )
target_link_libraries(make_f2fs_casefold
    libext2_uuid
    libbase
    libsparse
    dl
    z
    )

add_executable(sload_f2fs
    ${SRC}/f2fs-tools/fsck/dir.c
    ${SRC}/f2fs-tools/fsck/dict.c
    ${SRC}/f2fs-tools/fsck/mkquota.c
    ${SRC}/f2fs-tools/fsck/quotaio.c
    ${SRC}/f2fs-tools/fsck/quotaio_tree.c
    ${SRC}/f2fs-tools/fsck/quotaio_v2.c
    ${SRC}/f2fs-tools/fsck/node.c
    ${SRC}/f2fs-tools/fsck/segment.c
    ${SRC}/f2fs-tools/fsck/xattr.c
    ${SRC}/f2fs-tools/fsck/main.c
    ${SRC}/f2fs-tools/fsck/mount.c
    ${SRC}/f2fs-tools/lib/libf2fs.c
    ${SRC}/f2fs-tools/lib/libf2fs_io.c
    ${SRC}/f2fs-tools/lib/nls_utf8.c
    ${SRC}/f2fs-tools/fsck/dump.c
    ${SRC}/f2fs-tools/fsck/fsck.c
    ${SRC}/f2fs-tools/fsck/sload.c
    ${SRC}/f2fs-tools/fsck/compress.c
    )
target_compile_definitions(sload_f2fs PRIVATE -DWITH_SLOAD)
target_link_libraries(sload_f2fs
    libselinux
    libsparse
    libbase
    libcutils
    liblog
    pcre2-8
    lz4_static
    dl
    z
    )
    
    