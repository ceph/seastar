#
# This file is open source software, licensed to you under the terms
# of the Apache License, Version 2.0 (the "License").  See the NOTICE file
# distributed with this work for additional information regarding copyright
# ownership.  You may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

#
# Copyright (C) 2018 Scylladb, Ltd.
#

find_path (lksctp-tools_INCLUDE_DIR
  NAMES netinet/sctp.h)

find_library (lksctp-tools_LIBRARY
  NAMES sctp)

if (lksctp-tools_INCLUDE_DIR AND lksctp-tools_LIBRARY)
  set (lksctp-tools_FOUND ON)
endif ()

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args (lksctp-tools
  FOUND_VAR lksctp-tools_FOUND
  REQUIRED_VARS
    lksctp-tools_INCLUDE_DIR
    lksctp-tools_LIBRARY)

if (lksctp-tools_FOUND)
  set (lksctp-tools_INCLUDE_DIRS ${lksctp-tools_INCLUDE_DIR})
endif ()

if (lksctp-tools_FOUND AND NOT (TARGET lksctp-tools::lksctp-tools))
  add_library (lksctp-tools::lksctp-tools UNKNOWN IMPORTED)

  set_target_properties (lksctp-tools::lksctp-tools
    PROPERTIES
      IMPORTED_LOCATION ${lksctp-tools_LIBRARY}
      INTERFACE_INCLUDE_DIRECTORIES ${lksctp-tools_INCLUDE_DIR})
endif ()

mark_as_advanced (
  lksctp-tools_INCLUDE_DIR
  lksctp-tools_LIBRARY)
