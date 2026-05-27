cmake_minimum_required(VERSION 4.0)

project(HelloWorld)

file(GLOB SOURCES "src/*.c")


add_executable(hello ${SOURCES})
