% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (wf).
-include ("wf.inc").
-include ("simplebridge.inc").
-compile (export_all).

%%% EXPOSE WF_UTILS %%%

f(S) -> wf_utils:f(S).
f(S, Args) -> wf_utils:f(S, Args).
coalesce(L) -> wf_utils:coalesce(L).

pickle(Data) -> wf_utils:pickle(Data).
depickle(Data) -> wf_utils:depickle(Data).
depickle(Data, SecondsToLive) -> wf_utils:depickle(Data, SecondsToLive).

is_string(Term) -> wf_utils:is_string(Term).

debug() -> wf_utils:debug().
break() -> wf_utils:break().



%%% EXPOSE WF_CONVERT %%%

to_list(T) -> wf_convert:to_list(T).
to_atom(T) -> wf_convert:to_atom(T).
to_binary(T) -> wf_convert:to_binary(T).
to_integer(T) -> wf_convert:to_integer(T).
clean_lower(S) -> wf_convert:clean_lower(S).
html_encode(S) -> wf_convert:html_encode(S).
html_encode(S, Encode) -> wf_convert:html_encode(S, Encode).



%%% EXPOSE WF_PLATFORM %%%

get_path_info(Context) -> Context#context.path_info.

get_page_module(Context) -> Context#context.page_module.

set_cookie(Key, Value, Context) -> set_cookie(Key, Value, "/", 20, Context).

set_cookie(Key, Value, Path, MinutesToLive, Context) -> 
	Area = Context#context.cookie_area,
	Area1 = Area:put(Key, Value, Path, MinutesToLive),
	Context#context { cookie_area = Area1 }.

get_cookie(Key, Context) -> 
	Area = Context#context.cookie_area,
	Area:get(Key).

%%% EXPOSE WF_BIND %%%

% TODO - Convert these.
% set(Element, Value) -> wf_bind:set(Element, Value).
% bind(BindingTuple, Record) -> wf_bind:bind(BindingTuple, Record).
% reverse_bind(BindingTuple) -> wf_bind:reverse_bind(BindingTuple).
% reverse_bind(BindingTuple, Record) -> wf_bind:reverse_bind(BindingTuple, Record).


%%% EXPOSE WF_RENDER %%%


render(Terms, Context) -> wf_render:render(Terms, Context).
update(Element, Terms, Context) -> wf_render:update(Element, Terms, Context).
insert_top(Element, Terms, Context) -> wf_render:insert_top(Element, Terms, Context).
insert_bottom(Element, Terms, Context) -> wf_render:insert_bottom(Element, Terms, Context).

wire(Actions, Context) -> wf_render:wire(Actions, Context).
wire(TargetID, Actions, Context) -> wf_render:wire(TargetID, Actions, Context).
wire(TriggerID, TargetID, Actions, Context) -> wf_render:wire(TriggerID, TargetID, Actions, Context).


%%% WF_CONTINUE %%%

continue(Tag, Function) -> wf_continuation:continue(Tag, Function).
continue(Tag, Function, Interval) -> wf_continuation:continue(Tag, Function, Interval).
continue(Tag, Function, Interval, Timeout) -> wf_continuation:continue(Tag, Function, Interval, Timeout).


%%% WF_COMET %%%

comet(Function) -> wf_comet:comet(Function).
comet_flush() -> wf_comet:comet_flush().


%%% WF_REDIRECT %%%

redirect(Url) -> wf_redirect:redirect(Url).
redirect_to_login(Url) -> wf_redirect:redirect_to_login(Url).
redirect_from_login(DefaultUrl) -> wf_redirect:redirect_from_login(DefaultUrl).



%%% WF_SESSION %%%

state(Key) -> wf_state:state(Key).
state(Key, Value) -> wf_state:state(Key, Value).
clear_state() -> wf_state:clear_state().


%%% WF_STATE %%%

user() -> wf_session:user().
user(User) -> wf_session:user(User).
clear_user() -> wf_session:clear_user().

role(Role) -> wf_session:role(Role).
role(Role, IsInRole) -> wf_session:role(Role, IsInRole).
clear_roles() -> wf_session:clear_roles().

session(Key) -> wf_session:session(Key).
session(Key, Value) -> wf_session:session(Key, Value).
clear_session() -> wf_session:clear_session().

logout() -> clear_user(), clear_roles(), clear_state(), clear_session().


%%% WF_QUERY %%%

q(Q) -> wf_query:q(Q).


%%% WF_PATH %%%

me_var() -> wf_render:me_var().
temp_id() -> wf_path:temp_id().
to_js_id(Path) -> wf_path:to_js_id(Path).


%%% OTHER %%%

flash(Terms) -> element_flash:add_flash(Terms).

assert(true, _) -> ok;
assert(false, Error) -> erlang:error(Error).





