# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lnugraha/Mixed-Precision-CG

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lnugraha/Mixed-Precision-CG/build

# Include any dependencies generated for this target.
include CMakeFiles/HACS.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/HACS.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/HACS.dir/flags.make

CMakeFiles/HACS.dir/main.cpp.o: CMakeFiles/HACS.dir/flags.make
CMakeFiles/HACS.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lnugraha/Mixed-Precision-CG/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/HACS.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HACS.dir/main.cpp.o -c /home/lnugraha/Mixed-Precision-CG/main.cpp

CMakeFiles/HACS.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HACS.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lnugraha/Mixed-Precision-CG/main.cpp > CMakeFiles/HACS.dir/main.cpp.i

CMakeFiles/HACS.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HACS.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lnugraha/Mixed-Precision-CG/main.cpp -o CMakeFiles/HACS.dir/main.cpp.s

CMakeFiles/HACS.dir/src/libmath.cpp.o: CMakeFiles/HACS.dir/flags.make
CMakeFiles/HACS.dir/src/libmath.cpp.o: ../src/libmath.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lnugraha/Mixed-Precision-CG/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/HACS.dir/src/libmath.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HACS.dir/src/libmath.cpp.o -c /home/lnugraha/Mixed-Precision-CG/src/libmath.cpp

CMakeFiles/HACS.dir/src/libmath.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HACS.dir/src/libmath.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lnugraha/Mixed-Precision-CG/src/libmath.cpp > CMakeFiles/HACS.dir/src/libmath.cpp.i

CMakeFiles/HACS.dir/src/libmath.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HACS.dir/src/libmath.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lnugraha/Mixed-Precision-CG/src/libmath.cpp -o CMakeFiles/HACS.dir/src/libmath.cpp.s

# Object files for target HACS
HACS_OBJECTS = \
"CMakeFiles/HACS.dir/main.cpp.o" \
"CMakeFiles/HACS.dir/src/libmath.cpp.o"

# External object files for target HACS
HACS_EXTERNAL_OBJECTS =

../HACS: CMakeFiles/HACS.dir/main.cpp.o
../HACS: CMakeFiles/HACS.dir/src/libmath.cpp.o
../HACS: CMakeFiles/HACS.dir/build.make
../HACS: CMakeFiles/HACS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lnugraha/Mixed-Precision-CG/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../HACS"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HACS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/HACS.dir/build: ../HACS

.PHONY : CMakeFiles/HACS.dir/build

CMakeFiles/HACS.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/HACS.dir/cmake_clean.cmake
.PHONY : CMakeFiles/HACS.dir/clean

CMakeFiles/HACS.dir/depend:
	cd /home/lnugraha/Mixed-Precision-CG/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lnugraha/Mixed-Precision-CG /home/lnugraha/Mixed-Precision-CG /home/lnugraha/Mixed-Precision-CG/build /home/lnugraha/Mixed-Precision-CG/build /home/lnugraha/Mixed-Precision-CG/build/CMakeFiles/HACS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/HACS.dir/depend

