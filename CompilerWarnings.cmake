function(set_project_warnings target_name)
set(
	CLANG_WARNINGS
	-Wall
    -Wextra
    -Wpedantic
    -Werror
    -Wshadow
    -Wconversion
    -Wsign-conversion
    -Wnon-virtual-dtor
    -Wold-style-cast
    -Wcast-align
    -Wunused
    -Woverloaded-virtual
    -Wnull-dereference
    -Wdouble-promotion
)

set(GCC_WARNINGS
    ${CLANG_WARNINGS}
    -Wmisleading-indentation
    -Wduplicated-cond
    -Wduplicated-branches
    -Wlogical-op
    -Wuseless-cast
)

set(MSVC_WARNINGS
    /W4
    /WX
)

if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(PROJECT_WARNINGS ${CLANG_WARNINGS})
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(PROJECT_WARNINGS ${GCC_WARNINGS})
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(PROJECT_WARNINGS ${MSVC_WARNINGS})
else()
    message(AUTHOR_WARNING "Unknown compiler, cannot apply warning settings: ${CMAKE_CXX_COMPILER_ID}")
endif()

target_compile_options(${target_name} PRIVATE ${PROJECT_WARNINGS})
endfunction()