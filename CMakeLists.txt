# Copyright (C) 2018 Burkhard Stubert
cmake_minimum_required(VERSION 3.5)

project(cuteradio)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(${PROJECT_NAME}
    main.cpp
    qml.qrc
    main.qml
    BottomBar.qml
)

find_package(Qt6Core)
find_package(Qt6Gui)
find_package(Qt6Qml)
find_package(Qt6Quick)
find_package(Qt6Multimedia)

target_link_libraries(${PROJECT_NAME}
    Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::Multimedia
)

install(
  TARGETS ${PROJECT_NAME}
  RUNTIME
    DESTINATION bin
    COMPONENT runtime
)
