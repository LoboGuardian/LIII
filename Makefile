BUILD_DIR   := build
CMAKE_FLAGS := -DCMAKE_BUILD_TYPE=$(or $(BUILD_TYPE),Release) \
               -DDEVELOPER_TRAFFIC_CONTROL=OFF
BINARY      := $(BUILD_DIR)/src/LIII
LAUNCHER    := $(BUILD_DIR)/src/liii.sh
JOBS        := $(shell nproc)

.PHONY: all configure build run package clean distclean help

all: build

configure: $(BUILD_DIR)/Makefile

$(BUILD_DIR)/Makefile:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake .. $(CMAKE_FLAGS)

build: configure
	$(MAKE) -C $(BUILD_DIR) -j$(JOBS)

run: build
	$(LAUNCHER)

package: build
	cd $(BUILD_DIR) && cpack -G RPM

clean:
	$(MAKE) -C $(BUILD_DIR) clean

distclean:
	rm -rf $(BUILD_DIR)

help:
	@echo "Targets:"
	@echo "  all        Build the project (default)"
	@echo "  configure  Run CMake configuration"
	@echo "  build      Compile the project"
	@echo "  run        Build and launch LIII"
	@echo "  package    Generate RPM package"
	@echo "  clean      Remove compiled objects"
	@echo "  distclean  Remove entire build directory"
	@echo ""
	@echo "Variables:"
	@echo "  BUILD_TYPE  Build type: Release (default) or Debug"
	@echo "              e.g. make BUILD_TYPE=Debug"
