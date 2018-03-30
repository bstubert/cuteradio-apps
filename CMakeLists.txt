# Copyright (C) 2018 Burkhard Stubert
cmake_minimum_required(VERSION 3.5)

project(CuteRadio)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(${PROJECT_NAME}
    main.cpp
    qml.qrc
    main.qml
    BottomBar.qml
)

find_package(Qt5Core)
find_package(Qt5Gui)
find_package(Qt5Qml)
find_package(Qt5Quick)
find_package(Qt5Multimedia)

target_link_libraries(${PROJECT_NAME}
    Qt5::Core Qt5::Gui Qt5::Qml Qt5::Quick Qt5::Multimedia
)
