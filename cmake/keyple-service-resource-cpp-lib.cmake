# *************************************************************************************************
# Copyright (c) 2021 Calypso Networks Association                                                 *
# https://www.calypsonet-asso.org/                                                                *
#                                                                                                 *
# See the NOTICE file(s) distributed with this work for additional information regarding          *
# copyright ownership.                                                                            *
#                                                                                                 *
# This program and the accompanying materials are made available under the terms of the Eclipse   *
# Public License 2.0 which is available at http://www.eclipse.org/legal/epl-2.0                   *
#                                                                                                 *
# SPDX-License-Identifier: EPL-2.0                                                                *
# *************************************************************************************************/

# Git
INCLUDE(FindGit)
FIND_PACKAGE(Git)
IF(NOT Git_FOUND)
	MESSAGE(FATAL_ERROR "Git not found!")
ENDIF()

# External Project
INCLUDE(FetchContent)

# Project
SET(EP_KEYPLE_SERVICE_RESOURCE "keyple-service-resource-cpp-lib")

FetchContent_Populate (
	${EP_KEYPLE_SERVICE_RESOURCE}
	
	GIT_REPOSITORY https://github.com/eclipse/${EP_KEYPLE_SERVICE_RESOURCE}.git
	GIT_TAG        ${KEYPLE_VERSION}
	GIT_SHALLOW    ON
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/externals/${EP_KEYPLE_SERVICE_RESOURCE}
	UPDATE_DISCONNECTED ON
)

ADD_SUBDIRECTORY(externals/${EP_KEYPLE_SERVICE_RESOURCE})
