project(ui_utils)


set(SRCS
	getstyleoptionprogressbar.cpp
	mainwindowwithtray.cpp
	set_dark_theme.cpp
	tabbeddialogcombo.cpp
	taskbar.cpp
)

set(HDRS
	getstyleoptionprogressbar.h
	set_dark_theme.h
	taskbar.h
)

set(HDRS_MOC
	mainwindowwithtray.h
	tabbeddialogcombo.h
)


QTX_WRAP_CPP(MOC_FILES
	${HDRS_MOC} 
)

source_group("sources" FILES
	${SRCS}
	${HDRS}
	${HDRS_MOC}
)

source_group(".generated" FILES
	${MOC_FILES} 
)

add_library(ui_utils STATIC
	${SRCS}
	${HDRS}
	${HDRS_MOC}
	${MOC_FILES} 
)

target_include_directories(ui_utils PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_BINARY_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/..
)

set(FILES_TO_TRANSLATE ${FILES_TO_TRANSLATE}
	${CMAKE_CURRENT_SOURCE_DIR}/mainwindowwithtray.cpp
	PARENT_SCOPE
)

set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "common")
