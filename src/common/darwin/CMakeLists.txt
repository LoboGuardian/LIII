project(Darwin)

set(HEADERS_TOMOC
	DarwinSingleton.h
	AppHandler.h
)

set(HEADERS
	AppDelegate.h
	media/multimedia.h
	NS2QtImpl.h
)

set(SOURCES
	AppHandler.mm
	AppDelegate.mm
	DarwinSingleton.cpp
	media/multimedia.mm
)

source_group(sources FILES 
	${HEADERS_TOMOC} 
	${HEADERS}
	${SOURCES}
)

QTX_WRAP_CPP(MOC_FILES
	${HEADERS_TOMOC}
)

source_group(".generated" FILES
	${MOC_FILES}
)

add_library(Darwin STATIC
	${MOC_FILES}
	${HEADERS_TOMOC} 
	${HEADERS}
	${SOURCES}
)

target_include_directories(Darwin PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_BINARY_DIR}
)

set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "common")
