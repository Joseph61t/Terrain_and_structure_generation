%%%-------------------------------------------------------------------
%% @doc senior_project top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(senior_project_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [#{id => dynamic_sup,
                start => {dynamic_sup, start, []},
                restart => transient,
                shutdown => 2000,
                type => supervisor,
                modules => [dynamic_sup]},
                #{id => dist,
                start => {dist, start, []},
                restart => transient,
                shutdown => 1,
                type => worker,
                modules => [dist]}],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions
