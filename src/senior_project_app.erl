%%%-------------------------------------------------------------------
%% @doc senior_project public API
%% @end
%%%-------------------------------------------------------------------

-module(senior_project_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    senior_project_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
