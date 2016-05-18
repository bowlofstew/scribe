Introduction
============

Scribe is a server for aggregating log data that's streamed in real
time from clients. It is designed to be scalable and reliable.


License (See LICENSE file for full license)
===========================================
Copyright 2007-2008 Facebook

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


Requirements
============

[libevent] Event Notification library
[boost] Boost C++ library (version 1.36 or later)
[thrift] Thrift framework (version 0.4.0 or later) 
    (use thrift with TNonBlockingServer graceful shutdown patch from here: https://github.com/praddy/thrift)
[fb303] Facebook Bassline (included in thrift/contrib/fb303/)
   fb303 r697294 or later is required.
[hadoop] optional. version 0.19.1 or higher (http://hadoop.apache.org)

These libraries are open source and may be freely obtained, but they are not
provided as a part of this distribution.
