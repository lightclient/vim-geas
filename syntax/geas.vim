" File: geas.vim
" Author: lightclient
" Description: Runtime files for geas

if exists("b:current_syntax")
    finish
endif

" Comment contained keywords
syntax keyword geasTodos contained TODO XXX FIXME NOTE

" Comment patterns
syntax match geasComment ";;.*$" contains=geasTodos

" Single-line string 
syntax region geasString start=/"/ skip=/\\\\\|\\"/ end=/"/ oneline

" Expression Macros
syntax match geasExpressionMacro "%\(abs\|selector\|keccak256\|address\)\>"

" Instruction Macros
syntax match geasInstructionMacro "%\(include\|assemble\|push\)\>"

" Labels
syntax match geasLabel "^\i*:$"

" Environment opcodes
syntax keyword geasEnvOpcode
	\ address 
	\ balance 
	\ origin
	\ caller
	\ callvalue
	\ calldataload
	\ calldatasize
	\ calldatacopy
	\ codesize
	\ codecopy
	\ gasprice
	\ returndatasize
	\ returndatacopy
	\ blockhash
	\ coinbase
	\ timestamp
	\ number
	\ difficulty
	\ gaslimit
	\ chainid
	\ selfbalance
	\ basefee

" Trie opcodes
syntax keyword geasTrieOpcode
	\ extcodesize
	\ extcodecopy
	\ extcodehash
	\ sload
	\ sstore
	\ selfdestruct

" Call opcodes
syntax keyword geasCallOpcode
	\ create
	\ call
	\ callcode
	\ delegatecall
	\ create2
	\ staticcall

" Push opcodes
syntax match geasRegularOpcode
	\ "\<push\(3[1-2]\|[1-9]\|[1-2][0-9]\)\>"
	\ nextgroup=geasConstant,geasLabelConst,geasExpressionMacro
	\ skipwhite

" Push constants
" Label constant
syntax match geasLabelConst	"\<\i*\>"	contained
" Decimal constant
syntax match geasConstant	"\<\d*\>"	contained
" Hex constant
syntax match geasConstant	"\<0x\x*\>"	contained
" Binary constant
syntax match geasConstant	"\<0b[0-1]*\>"	contained
" Octal constant
syntax match geasConstant	"\<0o\o*\>"	contained

" Regular opcodes
syntax match geasRegularOpcode "\<swap\(1[0-6]\|[1-9]\)\>"
syntax match geasRegularOpcode "\<dup\(1[0-6]\|[1-9]\)\>"
syntax match geasRegularOpcode "\<log\([0-4]\)\>"

syntax keyword geasRegularOpcode
	\ stop
	\ add
	\ mul
	\ sub
	\ div
	\ sdiv
	\ mod
	\ smod
	\ addmod
	\ mulmod
	\ exp
	\ signextend
	\ lt
	\ gt
	\ slt
	\ sgt
	\ eq
	\ iszero
	\ and
	\ or
	\ xor
	\ not
	\ byte
	\ shl
	\ shr
	\ sar
	\ keccak256
	\ pop
	\ mload
	\ mstore
	\ mstore8
	\ jump
	\ jumpi
	\ pc
	\ msize
	\ gas
	\ jumpdest
	\ revert
	\ invalid
	\ return

" Set highlights
highlight link geasTodos Todo
highlight link geasComment Comment
highlight link geasKeyword Keyword
highlight link geasExpressionMacro Function
highlight link geasInstructionMacro Macro
highlight link geasString String

highlight link geasLabel Type
highlight link geasConstant Constant
highlight link geasLabelConst Type

highlight link geasEnvOpcode Special
highlight link geasTrieOpcode Special
highlight link geasCallOpcode Special
highlight link geasRegularOpcode Statement

let b:current_syntax = "geas"
