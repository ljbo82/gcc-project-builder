# This file is part of gcc-project-builder.
# Copyright (C) 2021 Leandro José Britto de Oliveira
#
# gcc-project-builder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# gcc-project-builder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with gcc-project-builder.  If not, see <https://www.gnu.org/licenses/>

ifndef _include_git_mk
_include_git_mk := 1

ifeq ($(REPO_DIR), )
    REPO_DIR := .
endif 

__gitRepoAvailable := $(shell cd $(REPO_DIR) > /dev/null 2>&1; git status > /dev/null 2>&1; echo $$?)
ifeq ($(__gitRepoAvailable), 0)
    gitCommit := $(shell cd $(REPO_DIR) > /dev/null 2>&1; git rev-parse HEAD > /dev/null 2>&1; echo $$?)
    ifeq ($(gitCommit), 0)
        gitCommit := $(shell cd $(REPO_DIR) > /dev/null 2>&1; git rev-parse HEAD)
        gitStatus := $(shell cd $(REPO_DIR) > /dev/null 2>&1; git status -s)
        ifeq ($(gitStatus),)
            # Clean tree
            gitStatus := 0
        else
            # Dirty tree
            gitStatus := 1
        endif
        gitTag := $(shell cd $(REPO_DIR) > /dev/null 2>&1; git describe --tags > /dev/null 2>&1; echo $$?)
        ifeq ($(gitTag), 0)
            gitTag := $(shell cd $(REPO_DIR) > /dev/null 2>&1; git describe --tags)
        else
            gitTag :=
        endif
    else
        gitCommit :=
    endif    
endif
undefine __gitRepoAvailable

endif # _include_git_mk

