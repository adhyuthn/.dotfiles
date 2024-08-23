" (ChatGPT made this) Vim syntax file for SPL language

if exists("b:current_syntax")
  finish
endif

syntax case match

" Keywords
syntax keyword splKeyword alias define encrypt breakpoint inline halt goto call return ireturn backup restore read readi print load loadi store multipush multipop while do endwhile break continue if then else endif

" Registers and Ports
syntax match splRegister /\<R[0-9]\>/ 
syntax match splRegister /\<R1[0-5]\>/
syntax match splPort /\<P[0-3]\>/
syntax keyword splRegister BP SP IP PTBR PTLR EIP EC EPN EMA

" Relational and Logical Operators
syntax match splRelop "==\|<=\|>=\|!=\|<\|>"
syntax match splLogop "&&\|||"

" Arithmetic Operators
syntax match splArithOp1 "[+]\|[-]"
syntax match splArithOp2 "[*]\|[/]\|[%]"

" Assignments and Negation
syntax match splAssignOp "="
syntax match splNotOp "!"

" Constants
syntax match splNumbers /\<0x[0-9A-Fa-f]\+\>/ " Hexadecimal
syntax match splNumbers /\<\d\+\>/ " Numbers
syntax keyword splConstant EX_HANDLER TIMER DISK CONSOLE INT_4 INT_5 INT_6 INT_7 INT_8 INT_9 INT_10 INT_11 INT_12 INT_13 INT_14 INT_15 INT_16 INT_17 INT_18 MOD_0 MOD_1 MOD_2 MOD_3 MOD_4 MOD_5 MOD_6 MOD_7 INT_CREATE INT_OPEN INT_CLOSE INT_DELETE INT_WRITE INT_SEEK INT_READ INT_FORK INT_EXEC INT_EXIT INT_GETPID INT_GETPPID INT_WAIT INT_SIGNAL INT_SEMGET INT_SEMRELEASE INT_SEMLOCK INT_SEMUNLOCK INT_SHUTDOWN INT_NEWUSR INT_REMUSR INT_SETPWD INT_GETUNAME INT_GETUID INT_LOGIN INT_LOGOUT INT_TEST0 INT_TEST1 INT_TEST2 INT_TEST3 RESOURCE_MANAGER PROCESS_MANAGER MEMORY_MANAGER FILE_MANAGER DEVICE_MANAGER CONTEXT_SWITCH SCHEDULER PAGER_MODULE BOOT_MODULE ACQUIRE_BUFFER RELEASE_BUFFER ACQUIRE_DISK ACQUIRE_INODE RELEASE_INODE ACQUIRE_SEMAPHORE RELEASE_SEMAPHORE ACQUIRE_TERMINAL RELEASE_TERMINAL GET_PCB_ENTRY FREE_USER_AREA_PAGE EXIT_PROCESS FREE_PAGE_TABLE KILL_ALL GET_FREE_PAGE RELEASE_PAGE GET_FREE_BLOCK RELEASE_BLOCK GET_CODE_PAGE GET_SWAP_BLOCK BUFFERED_WRITE BUFFERED_READ OPEN CLOSE DISK_STORE DISK_LOAD TERMINAL_WRITE TERMINAL_READ SWAP_OUT SWAP_IN PROCESS_TABLE OPEN_FILE_TABLE SEMAPHORE_TABLE	29056 MEMORY_FREE_LIST FILE_STATUS_TABLE DISK_STATUS_TABLE SYSTEM_STATUS_TABLE TERMINAL_STATUS_TABLE PAGE_TABLE_BASE BUFFER_TABLE DISK_MAP_TABLE INODE_TABLE USER_TABLE DISK_FREE_LIST ROOT_FILE LIBRARY INIT LOGIN SHELL IDLE SWAPPER BUFFER EXCLUSIVE OPEN_ACCESS ROOT DATA EXEC FILE SEMAPHORE KERNEL INODE_ROOT READY RUNNING CREATED TERMINATED WAIT_DISK WAIT_FILE WAIT_BUFFER WAIT_TERMINAL WAIT_PROCESS WAIT_SEMAPHORE WAIT_MEM ALLOCATED MEM_LOW MEM_HIGH MAX_TICK EXCEPTION RESOURCE_TABLE_OFFSET PAGE_SIZE NUM_MEM_PAGES XFS_BSIZE MAX_FILE_BLOCKS DISK_SWAP_AREA DISK_FREE_AREA DISK_SIZE MAX_PROC_NUM PT_ENTRY_SIZE MAX_OPENFILE_NUM MAX_MEM_PAGE MAX_SEM_COUNT MAX_PROC_PAGES MAX_BUFFER BUFFER_BASE MAX_FILE_NUM MAX_FILE_SIZE MAX_USER_NUM IDLE_PROCESS INIT_PROCESS LOGIN_PROCESS SHELL_PROCESS SWAPPER_DAEMON ZERO ONE



" Identifiers
syntax match splIdent /\<[a-zA-Z_][a-zA-Z0-9_]*\>/

" Strings
syntax region splString start=/"/ skip=/\\./ end=/"/

" Comments
syntax match splComment "//.*$"

" Highlighting groups
hi def link splKeyword Keyword
hi def link splRegister Constant
hi def link splPort Constant
hi def link splRelop Operator
hi def link splLogop Operator
hi def link splArithOp1 Operator
hi def link splArithOp2 Operator
hi def link splAssignOp Operator
hi def link splNotOp Operator
hi def link splConstant Constant
hi def link splNumbers Number
hi def link splIdent Identifier
hi def link splString String
hi def link splComment Comment

let b:current_syntax = "spl"
