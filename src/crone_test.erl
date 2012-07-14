%%% BEGIN crone_test.erl %%%
%%%
%%% crone_test - Tests for crone task scheduler for Erlang/OTP
%%% Copyright (c)2002-2012, Chris Pressey, Cat's Eye Technologies.
%%% All rights reserved.
%%%
%%% Redistribution and use in source and binary forms, with or without
%%% modification, are permitted provided that the following conditions
%%% are met:
%%%
%%%  1. Redistributions of source code must retain the above copyright
%%%     notices, this list of conditions and the following disclaimer.
%%%  2. Redistributions in binary form must reproduce the above copyright
%%%     notices, this list of conditions, and the following disclaimer in
%%%     the documentation and/or other materials provided with the
%%%     distribution.
%%%  3. Neither the names of the copyright holders nor the names of their
%%%     contributors may be used to endorse or promote products derived
%%%     from this software without specific prior written permission.
%%%
%%% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
%%% ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES INCLUDING, BUT NOT
%%% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
%%% FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
%%% COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
%%% INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
%%% BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%%% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
%%% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
%%% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
%%% ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%%% POSSIBILITY OF SUCH DAMAGE.

%% @doc Simple tests for <code>crone</code>.
%%
%% @end

-module(crone_test).
-vsn('2002.0703').
-author('catseye@catseye.mb.ca').
-copyright('Copyright (c)2002 Cat`s Eye Technologies. All rights reserved.').

-export([start/0]).

%% @spec start() -> [pid()]
%% @doc Runs a simple <code>crone</code> test.

start() ->
  crone:start([
         {
           {daily, {every, {23, sec}, {between, {3, pm}, {3, 30, pm}}}},
           {io, fwrite, ["Hello, world!~n"]}
         },
         {
           {daily, {3, 30, pm}},
           {io, fwrite, ["It's three thirty~n"]}
         },
         {
           {daily, [{1, 10, am}, {1, 07, 30, am}]},
           {io, fwrite, ["Bing~n"]}
         },
         {
           {weekly, thu, {2, am}},
           {io, fwrite, ["It's 2 Thursday morning~n"]}
         },
         {
           {weekly, wed, {2, am}},
           {io, fwrite, ["It's 2 Wednesday morning~n"]}
         },
         {
           {weekly, fri, {2, am}},
           {io, fwrite, ["It's 2 Friday morning~n"]}
         },
         {
           {monthly, 1, {2, am}},
           {io, fwrite, ["First of the month!~n"]}
         },
         {
           {monthly, 4, {2, am}},
           {io, fwrite, ["Fourth of the month!~n"]}
         }
       ]).

%%% END of crone_test.erl %%%
