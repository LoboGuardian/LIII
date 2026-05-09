project(Traffic_Limitation)

set(HEADERS_TOMOC
	InterceptTimer.h
	NetworkReplyAdaptor.h
)

set(HEADERS
	InterceptingApplication.h
	qplatformdefs.h
	TrafficControl.h
	QConnectionObjectEx.h
)

set(SOURCES
	NetworkReplyAdaptor.cpp
	TrafficControl.cpp
	InterceptTimer.cpp
)

source_group("sources" FILES 
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

add_library(Traffic_Limitation STATIC
	${HEADERS_TOMOC} 
	${HEADERS} 
	${SOURCES}
	${MOC_FILES}
)

target_include_directories(Traffic_Limitation PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_BINARY_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/..
	${CMAKE_CURRENT_SOURCE_DIR}/../../3rdparty
	${ZLIB_INCLUDE_DIR}
)

if(APPLE)
	target_include_directories(Traffic_Limitation PRIVATE
		${QT_INCLUDE_DIR}/../../src/network/access
		${QT_INCLUDE_DIR}/../../include/QtCore
	)
endif()

if(WIN32)
	target_include_directories(Traffic_Limitation PRIVATE
		${QT_INCLUDE_DIR}/../src/network/access
	)
endif()

target_include_directories(Traffic_Limitation PRIVATE
	${Qt5Network_PRIVATE_INCLUDE_DIRS}
	${Qt5Core_PRIVATE_INCLUDE_DIRS}
)

add_dependencies(Traffic_Limitation
	QtSingleApplication
	Utilities
)

set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "common")
