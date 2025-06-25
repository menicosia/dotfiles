# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

echo "enabling custom-bobby-py theme"

SCM_THEME_PROMPT_DIRTY=" ${red?}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green?}|"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
GIT_THEME_PROMPT_PREFIX=" ${green?}|"
GIT_THEME_PROMPT_SUFFIX="${green?}|"

CONDAENV_THEME_PROMPT_SUFFIX="|"

function __bobby_clock() {
    printf '%s' "$(clock_prompt) "

    if [[ "${THEME_SHOW_CLOCK_CHAR:-}" == "true" ]]; then
        printf '$s' "$(clock_char) "
    fi
}

function prompt_command() {
        PS1="\n$(__bobby_clock)"
	PS1+="${yellow?}$(python_version_prompt) " # Name of virtual env followed by python version
	PS1+="${purple?}(\h) "
	# PS1+="${reset_color?}in "
	PS1+="${green?}\w\n"
	PS1+="${bold_cyan?}$(scm_char)"
	PS1+="${green?}$(scm_prompt_info) "
	PS1+="${green?}→${reset_color?} "
}

safe_append_prompt_command prompt_command
