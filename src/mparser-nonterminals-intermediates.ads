with
MParser.Tokens,
MParser.Terminals,
MParser.Internals.Production,
MParser.Internals.List_Builder,
MParser.Internals.Option_Builder,
MParser.Internals.Production_List,
MParser.Internals.Sequence_Builder
;

Package MParser.Nonterminals.Intermediates is
   Function Get_Lists     return MParser.Internals.Production_List.Instance;
   Function Get_Options   return MParser.Internals.Production_List.Instance;
   Function Get_Sequences return MParser.Internals.Production_List.Instance;

   Command_Productions,
   Command_Syntax       : constant MParser.Internals.Production_List.Instance;


Private
   use MParser.Terminals;

   -- Bring "&", "+", "<=", and "and" into direct visibility.
   use type Token_List.Instance;
   use type MParser.Internals.Production.Right_Hand_Side;
   use type MParser.Internals.Production.Instance;
   use type MParser.Internals.Production_List.Instance;

   Command_Productions : constant MParser.Internals.Production_List.Instance :=
     cmd_BREAK		<= LC_BREAK					and
     cmd_BREAK		<= SC_BREAK					and
     cmd_CLOSE		<= LC_CLOSE					and
     cmd_CLOSE		<= SC_CLOSE					and
     cmd_DO		<= LC_DO					and
     cmd_DO		<= SC_DO					and
     cmd_ELSE		<= LC_ELSE					and
     cmd_ELSE		<= SC_ELSE					and
     cmd_FOR		<= LC_FOR					and
     cmd_FOR		<= SC_FOR					and
     cmd_GOTO		<= LC_GOTO					and
     cmd_GOTO		<= SC_GOTO					and
     cmd_HALT		<= LC_HALT					and
     cmd_HALT		<= SC_HALT					and
     cmd_HANG		<= LC_HANG					and
     cmd_HANG		<= SC_HANG					and
     cmd_IF		<= LC_IF					and
     cmd_IF		<= SC_IF					and
     cmd_JOB		<= LC_JOB					and
     cmd_JOB		<= SC_JOB					and
     cmd_KILL		<= LC_KILL					and
     cmd_KILL		<= SC_KILL					and
     cmd_LOCK		<= LC_LOCK					and
     cmd_LOCK		<= SC_LOCK					and
     cmd_MERGE		<= LC_MERGE					and
     cmd_MERGE		<= SC_MERGE					and
     cmd_NEW		<= LC_NEW					and
     cmd_NEW		<= SC_NEW					and
     cmd_OPEN		<= LC_OPEN					and
     cmd_OPEN		<= SC_OPEN					and
     cmd_QUIT		<= LC_QUIT					and
     cmd_QUIT		<= SC_QUIT					and
     cmd_READ		<= LC_READ					and
     cmd_READ		<= SC_READ					and
     cmd_SET		<= LC_SET					and
     cmd_SET		<= SC_SET					and
     cmd_TCOMMIT	<= LC_TCOMMIT					and
     cmd_TCOMMIT	<= SC_TCOMMIT					and
     cmd_TRESTART	<= LC_TRESTART					and
     cmd_TRESTART	<= SC_TRESTART					and
     cmd_TROLLBACK	<= LC_TROLLBACK					and
     cmd_TROLLBACK	<= SC_TROLLBACK					and
     cmd_TSTART		<= LC_TSTART					and
     cmd_TSTART		<= SC_TSTART					and
     cmd_USE		<= LC_USE					and
     cmd_USE		<= SC_USE					and
     cmd_VIEW		<= LC_VIEW					and
     cmd_VIEW		<= SC_VIEW					and
     cmd_WRITE		<= LC_WRITE					and
     cmd_WRITE		<= SC_WRITE					and
     cmd_XECUTE		<= LC_XECUTE					and
     cmd_XECUTE		<= SC_XECUTE					and
     cmd_Z		<= SC_Z;

   Command_Syntax : constant MParser.Internals.Production_List.Instance :=
     syn_BREAK		<= cmd_BREAK & postcond & Opt_SP		and
     syn_CLOSE		<= cmd_CLOSE & postcond & SP & close_arg_List	and
     syn_DO		<= cmd_DO & postcond & Opt_SP			and
     syn_DO		<= cmd_DO & postcond & SP & do_arg_list		and
     syn_ELSE		<= cmd_ELSE & Opt_SP				and
     syn_FOR		<= cmd_FOR & Opt_SP				and
     syn_FOR		<= cmd_FOR & SP & lvn & forparameter_List	and
     syn_GOTO		<= cmd_GOTO & postcond & SP & goto_arg_List	and
     syn_HALT		<= cmd_HALT & postcond & Opt_SP			and
     syn_HANG		<= cmd_HANG & postcond & SP & hang_arg_List	and
     syn_IF		<= cmd_IF & Opt_SP				and
     syn_IF		<= cmd_IF & SP & if_arg_List			and
     syn_JOB		<= cmd_JOB & postcond & SP & job_arg_List	and
     syn_KILL		<= cmd_KILL & postcond & Opt_SP			and
     syn_KILL		<= cmd_KILL & postcond & SP & kill_arg_List	and
     syn_LOCK		<= cmd_LOCK & postcond & Opt_SP			and
     syn_LOCK		<= cmd_LOCK & postcond & SP & lock_arg_List	and
     syn_MERGE		<= cmd_MERGE & postcond & SP & merge_arg_List	and
     syn_NEW		<= cmd_NEW & postcond & Opt_SP			and
     syn_NEW		<= cmd_NEW & postcond & SP & new_arg_List	and
     syn_OPEN		<= cmd_OPEN & postcond & SP & open_arg_List	and
     syn_QUIT		<= cmd_QUIT & postcond & Opt_SP			and
     syn_QUIT		<= cmd_QUIT & postcond & SP & expr		and
--       syn_QUIT		<= cmd_QUIT & postcond & SP & "@ expratom V expr"
     syn_READ		<= cmd_READ & postcond & SP & read_arg_List	and
     syn_SET		<= cmd_SET & postcond & SP & set_arg_List	and
     syn_TCOMMIT	<= cmd_TCOMMIT & postcond & Opt_SP		and
     syn_TRESTART	<= cmd_TRESTART & postcond & Opt_SP		and
     syn_TROLLBACK	<= cmd_TROLLBACK & postcond & Opt_SP		and
     syn_TSTART		<= cmd_TSTART & postcond & Opt_SP		and
     syn_TSTART		<= cmd_TSTART & postcond & SP & tstart_arg_List	and
--       syn_TSTART		<= cmd_TSTART & postcond & SP & "@ expratom V tstartargument"		and
     syn_USE		<= cmd_USE & postcond & SP & use_arg_List	and
--       syn_VIEW		<= cmd_VIEW & postcond & "arguments unspecified" and
     syn_WRITE		<= cmd_WRITE & postcond & SP & write_arg_List	and
     syn_XECUTE		<= cmd_XECUTE & postcond & SP & xecute_arg_List;--	and
--       syn_Z		<= cmd_Z & "arguments unspecified";

End MParser.Nonterminals.Intermediates;
