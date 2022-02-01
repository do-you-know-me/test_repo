add_library(libext4 STATIC
    ${SRC}/extras/ext4_utils/ext4_utils.cpp
    ${SRC}/extras/ext4_utils/wipe.cpp
    ${SRC}/extras/ext4_utils/ext4_sb.cpp
    )
target_include_directories(libext4 PUBLIC
    ${SRC}/core/libsparse/include 
    ${SRC}/core/include 
    ${SRC}/selinux/libselinux/include
    ${SRC}/extras/ext4_utils/include 
    ${SRC}/libbase/include
    )

add_library(libfsmgr STATIC
    ${SRC}/core/fs_mgr/liblp/images.cpp
    ${SRC}/core/fs_mgr/liblp/partition_opener.cpp
    ${SRC}/core/fs_mgr/liblp/reader.cpp
    ${SRC}/core/fs_mgr/liblp/utility.cpp
    ${SRC}/core/fs_mgr/liblp/writer.cpp
    )
target_include_directories(libfsmgr PRIVATE
    ${SRC}/core/fs_mgr/liblp/include 
    ${SRC}/libbase/include
    ${SRC}/extras/ext4_utils/include 
    ${SRC}/core/libsparse/include
    ${SRC}/boringssl/include
    )
target_link_libraries(libfsmgr PUBLIC fmt::fmt)

add_executable(fastboot
    ${SRC}/core/fastboot/bootimg_utils.cpp
    ${SRC}/core/fastboot/fastboot.cpp
    ${SRC}/core/fastboot/fastboot_driver.cpp
    ${SRC}/core/fastboot/fs.cpp
    ${SRC}/core/fastboot/main.cpp
    ${SRC}/core/fastboot/socket.cpp
    ${SRC}/core/fastboot/tcp.cpp
    ${SRC}/core/fastboot/udp.cpp
    ${SRC}/core/fastboot/usb_linux.cpp
    ${SRC}/core/fastboot/vendor_boot_img_utils.cpp
    ${SRC}/core/fastboot/util.cpp
    )

target_include_directories(fastboot PRIVATE
    ${SRC}/libbase/include 
    ${SRC}/libbuildversion/include 
    ${SRC}/core/include 
    ${SRC}/core/adb 
    ${SRC}/core/libsparse/include
    ${SRC}/core/fs_mgr/liblp/include 
    ${SRC}/core/fs_mgr/libstorage_literals 
    ${SRC}/core/libziparchive/include
    ${SRC}/extras/ext4_utils/include 
    ${SRC}/extras/f2fs_utils
    ${SRC}/mkbootimg/include/bootimg
    ${SRC}/avb
    )
target_compile_definitions(fastboot PRIVATE
    -DANDROID_BASE_UNIQUE_FD_DISABLE_IMPLICIT_CONVERSION
    -D_GNU_SOURCE 
    -D_XOPEN_SOURCE=700 
    -DUSE_F2FS
    )
target_link_libraries(fastboot
    libdiagnoseusb
    libsparse 
    libziparchive
    libbuildversion
    libcutils 
    libfsmgr 
    libutils
    libbase 
    libext4 
    libselinux 
    libsepol 
    liblog
    crypto
    pcre2-8 
    c++_static
    dl
    z
    )