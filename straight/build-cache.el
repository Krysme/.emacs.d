
:tanat

"27.2"

#s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data ("org-elpa" ("2021-07-26 17:58:15" nil (:local-repo nil :package "org-elpa" :type git)) "melpa" ("2021-07-26 17:58:15" nil (:type git :host github :repo "melpa/melpa" :build nil :package "melpa" :local-repo "melpa")) "gnu-elpa-mirror" ("2021-07-26 17:58:15" nil (:type git :host github :repo "emacs-straight/gnu-elpa-mirror" :build nil :package "gnu-elpa-mirror" :local-repo "gnu-elpa-mirror")) "el-get" ("2021-07-26 17:58:15" nil (:type git :host github :repo "dimitri/el-get" :build nil :files ("*.el" ("recipes" "recipes/el-get.rcp") "methods" "el-get-pkg.el") :flavor melpa :package "el-get" :local-repo "el-get")) "emacsmirror-mirror" ("2021-07-26 17:58:15" nil (:type git :host github :repo "emacs-straight/emacsmirror-mirror" :build nil :package "emacsmirror-mirror" :local-repo "emacsmirror-mirror")) "straight" ("2021-07-26 17:58:15" ("emacs") (:type git :host github :repo "raxod502/straight.el" :files ("straight*.el") :branch "master" :package "straight" :local-repo "straight.el")) "evil" ("2021-07-26 17:58:15" ("emacs" "goto-chg" "cl-lib") (:type git :flavor melpa :files (:defaults "doc/build/texinfo/evil.texi" (:exclude "evil-test-helpers.el") "evil-pkg.el") :host github :repo "emacs-evil/evil" :package "evil" :local-repo "evil")) "goto-chg" ("2021-07-26 17:58:15" ("emacs") (:type git :flavor melpa :host github :repo "emacs-evil/goto-chg" :package "goto-chg" :local-repo "goto-chg")) "selectrum" ("2021-07-26 17:58:15" ("emacs") (:type git :flavor melpa :host github :repo "raxod502/selectrum" :package "selectrum" :local-repo "selectrum")) "smooth-scrolling" ("2021-07-26 17:58:16" nil (:type git :flavor melpa :host github :repo "aspiers/smooth-scrolling" :package "smooth-scrolling" :local-repo "smooth-scrolling")) "spacemacs-theme" ("2021-07-26 17:58:16" nil (:type git :flavor melpa :host github :repo "nashamri/spacemacs-theme" :package "spacemacs-theme" :local-repo "spacemacs-theme")) "prescient" ("2021-07-26 17:58:15" ("emacs") (:type git :flavor melpa :files ("prescient.el" "prescient-pkg.el") :host github :repo "raxod502/prescient.el" :package "prescient" :local-repo "prescient.el")) "selectrum-prescient" ("2021-07-26 17:58:15" ("emacs" "prescient" "selectrum") (:flavor melpa :files ("selectrum-prescient.el" "selectrum-prescient-pkg.el") :package "selectrum-prescient" :local-repo "prescient.el" :type git :repo "raxod502/prescient.el" :host github)) "consult" ("2021-07-26 17:58:15" ("emacs") (:type git :flavor melpa :host github :repo "minad/consult" :package "consult" :local-repo "consult")) "rainbow-delimiters" ("2021-07-26 17:58:15" nil (:type git :flavor melpa :host github :repo "Fanael/rainbow-delimiters" :package "rainbow-delimiters" :local-repo "rainbow-delimiters")) "paredit" ("2021-07-26 17:58:15" nil (:type git :flavor melpa :files ("paredit.el" "paredit-pkg.el") :repo "https://mumble.net/~campbell/git/paredit.git" :package "paredit" :local-repo "paredit")) "vterm" ("2021-07-26 17:58:15" ("emacs") (:type git :flavor melpa :files ("*" (:exclude ".dir-locals.el" ".gitignore" ".clang-format" ".travis.yml") "vterm-pkg.el") :host github :repo "akermu/emacs-libvterm" :package "vterm" :local-repo "emacs-libvterm")) "undo-tree" ("2021-07-26 17:58:15" nil (:type git :host github :repo "emacs-straight/undo-tree" :files ("*" (:exclude ".git")) :package "undo-tree" :local-repo "undo-tree"))))

#s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data ("straight" ((straight-autoloads straight-x straight) (autoload 'straight-remove-unused-repos "straight" "Remove unused repositories from the repos directory.
A repo is considered \"unused\" if it was not explicitly requested via
`straight-use-package' during the current Emacs session.
If FORCE is non-nil do not prompt before deleting repos.

(fn &optional FORCE)" t nil) (autoload 'straight-get-recipe "straight" "Interactively select a recipe from one of the recipe repositories.
All recipe repositories in `straight-recipe-repositories' will
first be cloned. After the recipe is selected, it will be copied
to the kill ring. With a prefix argument, first prompt for a
recipe repository to search. Only that repository will be
cloned.

From Lisp code, SOURCES should be a subset of the symbols in
`straight-recipe-repositories'. Only those recipe repositories
are cloned and searched. If it is nil or omitted, then the value
of `straight-recipe-repositories' is used. If SOURCES is the
symbol `interactive', then the user is prompted to select a
recipe repository, and a list containing that recipe repository
is used for the value of SOURCES. ACTION may be `copy' (copy
recipe to the kill ring), `insert' (insert at point), or nil (no
action, just return it).

(fn &optional SOURCES ACTION)" t nil) (autoload 'straight-visit-package-website "straight" "Interactively select a recipe, and visit the package's website." t nil) (autoload 'straight-use-package "straight" "Register, clone, build, and activate a package and its dependencies.
This is the main entry point to the functionality of straight.el.

MELPA-STYLE-RECIPE is either a symbol naming a package, or a list
whose car is a symbol naming a package and whose cdr is a
property list containing e.g. `:type', `:local-repo', `:files',
and VC backend specific keywords.

First, the package recipe is registered with straight.el. If
NO-CLONE is a function, then it is called with two arguments: the
package name as a string, and a boolean value indicating whether
the local repository for the package is available. In that case,
the return value of the function is used as the value of NO-CLONE
instead. In any case, if NO-CLONE is non-nil, then processing
stops here.

Otherwise, the repository is cloned, if it is missing. If
NO-BUILD is a function, then it is called with one argument: the
package name as a string. In that case, the return value of the
function is used as the value of NO-BUILD instead. In any case,
if NO-BUILD is non-nil, then processing halts here. Otherwise,
the package is built and activated. Note that if the package
recipe has a nil `:build' entry, then NO-BUILD is ignored
and processing always stops before building and activation
occurs.

CAUSE is a string explaining the reason why
`straight-use-package' has been called. It is for internal use
only, and is used to construct progress messages. INTERACTIVE is
non-nil if the function has been called interactively. It is for
internal use only, and is used to determine whether to show a
hint about how to install the package permanently.

Return non-nil if package was actually installed, and nil
otherwise (this can only happen if NO-CLONE is non-nil).

(fn MELPA-STYLE-RECIPE &optional NO-CLONE NO-BUILD CAUSE INTERACTIVE)" t nil) (autoload 'straight-register-package "straight" "Register a package without cloning, building, or activating it.
This function is equivalent to calling `straight-use-package'
with a non-nil argument for NO-CLONE. It is provided for
convenience. MELPA-STYLE-RECIPE is as for
`straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-use-package-no-build "straight" "Register and clone a package without building it.
This function is equivalent to calling `straight-use-package'
with nil for NO-CLONE but a non-nil argument for NO-BUILD. It is
provided for convenience. MELPA-STYLE-RECIPE is as for
`straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-use-package-lazy "straight" "Register, build, and activate a package if it is already cloned.
This function is equivalent to calling `straight-use-package'
with symbol `lazy' for NO-CLONE. It is provided for convenience.
MELPA-STYLE-RECIPE is as for `straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-use-recipes "straight" "Register a recipe repository using MELPA-STYLE-RECIPE.
This registers the recipe and builds it if it is already cloned.
Note that you probably want the recipe for a recipe repository to
include a nil `:build' property, to unconditionally
inhibit the build phase.

This function also adds the recipe repository to
`straight-recipe-repositories', at the end of the list.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-override-recipe "straight" "Register MELPA-STYLE-RECIPE as a recipe override.
This puts it in `straight-recipe-overrides', depending on the
value of `straight-current-profile'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-check-package "straight" "Rebuild a PACKAGE if it has been modified.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. See also `straight-rebuild-package' and
`straight-check-all'.

(fn PACKAGE)" t nil) (autoload 'straight-check-all "straight" "Rebuild any packages that have been modified.
See also `straight-rebuild-all' and `straight-check-package'.
This function should not be called during init." t nil) (autoload 'straight-rebuild-package "straight" "Rebuild a PACKAGE.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument RECURSIVE, rebuild
all dependencies as well. See also `straight-check-package' and
`straight-rebuild-all'.

(fn PACKAGE &optional RECURSIVE)" t nil) (autoload 'straight-rebuild-all "straight" "Rebuild all packages.
See also `straight-check-all' and `straight-rebuild-package'." t nil) (autoload 'straight-prune-build-cache "straight" "Prune the build cache.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build mtime information and any cached
autoloads discarded." nil nil) (autoload 'straight-prune-build-directory "straight" "Prune the build directory.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build directories deleted." nil nil) (autoload 'straight-prune-build "straight" "Prune the build cache and build directory.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build mtime information discarded and
their build directories deleted." t nil) (autoload 'straight-normalize-package "straight" "Normalize a PACKAGE's local repository to its recipe's configuration.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'.

(fn PACKAGE)" t nil) (autoload 'straight-normalize-all "straight" "Normalize all packages. See `straight-normalize-package'.
Return a list of recipes for packages that were not successfully
normalized. If multiple packages come from the same local
repository, only one is normalized.

PREDICATE, if provided, filters the packages that are normalized.
It is called with the package name as a string, and should return
non-nil if the package should actually be normalized.

(fn &optional PREDICATE)" t nil) (autoload 'straight-fetch-package "straight" "Try to fetch a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
fetch not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-fetch-package-and-deps "straight" "Try to fetch a PACKAGE and its (transitive) dependencies.
PACKAGE, its dependencies, their dependencies, etc. are fetched
from their primary remotes.

PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
fetch not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-fetch-all "straight" "Try to fetch all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, fetch not just from primary
remotes but also from upstreams (for forked packages).

Return a list of recipes for packages that were not successfully
fetched. If multiple packages come from the same local
repository, only one is fetched.

PREDICATE, if provided, filters the packages that are fetched. It
is called with the package name as a string, and should return
non-nil if the package should actually be fetched.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload 'straight-merge-package "straight" "Try to merge a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
merge not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-merge-package-and-deps "straight" "Try to merge a PACKAGE and its (transitive) dependencies.
PACKAGE, its dependencies, their dependencies, etc. are merged
from their primary remotes.

PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
merge not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-merge-all "straight" "Try to merge all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, merge not just from primary
remotes but also from upstreams (for forked packages).

Return a list of recipes for packages that were not successfully
merged. If multiple packages come from the same local
repository, only one is merged.

PREDICATE, if provided, filters the packages that are merged. It
is called with the package name as a string, and should return
non-nil if the package should actually be merged.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload 'straight-pull-package "straight" "Try to pull a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM, pull
not just from primary remote but also from upstream (for forked
packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-pull-package-and-deps "straight" "Try to pull a PACKAGE and its (transitive) dependencies.
PACKAGE, its dependencies, their dependencies, etc. are pulled
from their primary remotes.

PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
pull not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-pull-all "straight" "Try to pull all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, pull not just from primary
remotes but also from upstreams (for forked packages).

Return a list of recipes for packages that were not successfully
pulled. If multiple packages come from the same local repository,
only one is pulled.

PREDICATE, if provided, filters the packages that are pulled. It
is called with the package name as a string, and should return
non-nil if the package should actually be pulled.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload 'straight-push-package "straight" "Push a PACKAGE to its primary remote, if necessary.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'.

(fn PACKAGE)" t nil) (autoload 'straight-push-all "straight" "Try to push all packages to their primary remotes.

Return a list of recipes for packages that were not successfully
pushed. If multiple packages come from the same local repository,
only one is pushed.

PREDICATE, if provided, filters the packages that are normalized.
It is called with the package name as a string, and should return
non-nil if the package should actually be normalized.

(fn &optional PREDICATE)" t nil) (autoload 'straight-freeze-versions "straight" "Write version lockfiles for currently activated packages.
This implies first pushing all packages that have unpushed local
changes. If the package management system has been used since the
last time the init-file was reloaded, offer to fix the situation
by reloading the init-file again. If FORCE is
non-nil (interactively, if a prefix argument is provided), skip
all checks and write the lockfile anyway.

Currently, writing version lockfiles requires cloning all lazily
installed packages. Hopefully, this inconvenient requirement will
be removed in the future.

Multiple lockfiles may be written (one for each profile),
according to the value of `straight-profiles'.

(fn &optional FORCE)" t nil) (autoload 'straight-thaw-versions "straight" "Read version lockfiles and restore package versions to those listed." t nil) (autoload 'straight-bug-report "straight" "Test straight.el in a clean environment.
ARGS may be any of the following keywords and their respective values:
  - :pre-bootstrap (Form)...
      Forms evaluated before bootstrapping straight.el
      e.g. (setq straight-repository-branch \"develop\")
      Note this example is already in the default bootstrapping code.

  - :post-bootstrap (Form)...
      Forms evaluated in the testing environment after boostrapping.
      e.g. (straight-use-package '(example :type git :host github))

  - :interactive Boolean
      If nil, the subprocess will immediately exit after the test.
      Output will be printed to `straight-bug-report--process-buffer'
      Otherwise, the subprocess will be interactive.

  - :preserve Boolean
      If non-nil, the test directory is left in the directory stored in the
      variable `temporary-file-directory'. Otherwise, it is
      immediately removed after the test is run.

  - :executable String
      Indicate the Emacs executable to launch.
      Defaults to the path of the current Emacs executable.

  - :raw Boolean
      If non-nil, the raw process output is sent to
      `straight-bug-report--process-buffer'. Otherwise, it is
      formatted as markdown for submitting as an issue.

  - :user-dir String
      If non-nil, the test is run with `user-emacs-directory' set to STRING.
      Otherwise, a temporary directory is created and used.
      Unless absolute, paths are expanded relative to the variable
      `temporary-file-directory'.

ARGS are accessible within the :pre/:post-bootsrap phases via the
locally bound plist, straight-bug-report-args.

(fn &rest ARGS)" nil t) (function-put 'straight-bug-report 'lisp-indent-function '0) (autoload 'straight-dependencies "straight" "Return a list of PACKAGE's dependencies.

(fn &optional PACKAGE)" t nil) (autoload 'straight-dependents "straight" "Return a list PACKAGE's dependents.

(fn &optional PACKAGE)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "straight" '("straight-"))) (defvar straight-x-pinned-packages nil "List of pinned packages.") (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "straight-x" '("straight-x-"))) (provide 'straight-autoloads)) "goto-chg" ((goto-chg goto-chg-autoloads) (autoload 'goto-last-change "goto-chg" "Go to the point where the last edit was made in the current buffer.
Repeat the command to go to the second last edit, etc.

To go back to more recent edit, the reverse of this command, use \\[goto-last-change-reverse]
or precede this command with \\[universal-argument] - (minus).

It does not go to the same point twice even if there has been many edits
there. I call the minimal distance between distinguishable edits \"span\".
Set variable `glc-default-span' to control how close is \"the same point\".
Default span is 8.
The span can be changed temporarily with \\[universal-argument] right before \\[goto-last-change]:
\\[universal-argument] <NUMBER> set current span to that number,
\\[universal-argument] (no number) multiplies span by 4, starting with default.
The so set span remains until it is changed again with \\[universal-argument], or the consecutive
repetition of this command is ended by any other command.

When span is zero (i.e. \\[universal-argument] 0) subsequent \\[goto-last-change] visits each and
every point of edit and a message shows what change was made there.
In this case it may go to the same point twice.

This command uses undo information. If undo is disabled, so is this command.
At times, when undo information becomes too large, the oldest information is
discarded. See variable `undo-limit'.

(fn ARG)" t nil) (autoload 'goto-last-change-reverse "goto-chg" "Go back to more recent changes after \\[goto-last-change] have been used.
See `goto-last-change' for use of prefix argument.

(fn ARG)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "goto-chg" '("glc-"))) (provide 'goto-chg-autoloads)) "evil" ((evil-states evil-common evil-development evil evil-integration evil-types evil-core evil-keybindings evil-macros evil-search evil-digraphs evil-autoloads evil-repeat evil-ex evil-command-window evil-commands evil-jumps evil-maps evil-pkg evil-vars) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-command-window" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-commands" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-common" '("bounds-of-evil-" "evil-" "forward-evil-"))) (autoload 'evil-mode "evil" nil t) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-core" '("evil-" "turn-o"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-digraphs" '("evil-digraph"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-ex" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-integration" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-jumps" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-macros" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-maps" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-repeat" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-search" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-states" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-types" '("evil-ex-get-optional-register-and-count"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-vars" '("evil-"))) (provide 'evil-autoloads)) "selectrum" ((selectrum selectrum-autoloads) (defvar selectrum-complete-in-buffer t "If non-nil, use Selectrum for `completion-in-region'.
This option needs to be set before activating `selectrum-mode'.") (custom-autoload 'selectrum-complete-in-buffer "selectrum" t) (autoload 'selectrum-select-from-history "selectrum" "Submit or insert candidate from minibuffer history.
To insert the history item into the previous session use the
binding for `selectrum-insert-current-candidate'. To submit the
history item and exit use `selectrum-select-current-candidate'." t nil) (autoload 'selectrum-completing-read "selectrum" "Read choice using Selectrum. Can be used as `completing-read-function'.
For PROMPT, COLLECTION, PREDICATE, REQUIRE-MATCH, INITIAL-INPUT,
HIST, DEF, and INHERIT-INPUT-METHOD, see `completing-read'.

(fn PROMPT COLLECTION &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" nil nil) (autoload 'selectrum-completing-read-multiple "selectrum" "Read one or more choices using Selectrum.
Replaces `completing-read-multiple'. For PROMPT, TABLE,
PREDICATE, REQUIRE-MATCH, INITIAL-INPUT, HIST, DEF, and
INHERIT-INPUT-METHOD, see `completing-read-multiple'.

The option `selectrum-completing-read-multiple-show-help' can be
used to control insertion of additional usage information into
the prompt.

(fn PROMPT TABLE &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" nil nil) (autoload 'selectrum-completion-in-region "selectrum" "Complete in-buffer text using a list of candidates.
Can be used as `completion-in-region-function'. For START, END,
COLLECTION, and PREDICATE, see `completion-in-region'.

(fn START END COLLECTION PREDICATE)" nil nil) (autoload 'selectrum-read-buffer "selectrum" "Read buffer using Selectrum. Can be used as `read-buffer-function'.
Actually, as long as `selectrum-completing-read' is installed in
`completing-read-function', `read-buffer' already uses Selectrum.
Installing this function in `read-buffer-function' makes sure the
buffers are sorted in the default order (most to least recently
used) rather than in whatever order is defined by
`selectrum-preprocess-candidates-function', which is likely to be
less appropriate. It also allows you to view hidden buffers,
which is otherwise impossible due to tricky behavior of Emacs'
completion machinery. For PROMPT, DEF, REQUIRE-MATCH, and
PREDICATE, see `read-buffer'.

(fn PROMPT &optional DEF REQUIRE-MATCH PREDICATE)" nil nil) (autoload 'selectrum-read-file-name "selectrum" "Read file name using Selectrum. Can be used as `read-file-name-function'.
For PROMPT, DIR, DEFAULT-FILENAME, MUSTMATCH, INITIAL, and
PREDICATE, see `read-file-name'.

(fn PROMPT &optional DIR DEFAULT-FILENAME MUSTMATCH INITIAL PREDICATE)" nil nil) (autoload 'selectrum--fix-dired-read-dir-and-switches "selectrum" "Make \\[dired] do the \"right thing\" with its default candidate.
By default \\[dired] uses `read-file-name' internally, which
causes Selectrum to provide you with the first file inside the
working directory as the default candidate. However, it would
arguably be more semantically appropriate to use
`read-directory-name', and this is especially important for
Selectrum since this causes it to select the working directory
initially.

To test that this advice is working correctly, type \\[dired] and
accept the default candidate. You should have opened the working
directory in Dired, and not a filtered listing for the current
file.

This is an `:around' advice for `dired-read-dir-and-switches'.
FUNC and ARGS are standard as in any `:around' advice.

(fn FUNC &rest ARGS)" nil nil) (autoload 'selectrum-read-library-name "selectrum" "Read and return a library name.
Similar to `read-library-name' except it handles `load-path'
shadows correctly." nil nil) (autoload 'selectrum--fix-minibuffer-message "selectrum" "Ensure the cursor stays at the front of the minibuffer message.
This advice adjusts where the cursor gets placed for the overlay
of `minibuffer-message' and ensures the overlay gets displayed at
the right place without blocking the display of candidates.

To test that this advice is working correctly, type \\[find-file]
twice in a row with `enable-recursive-minibuffers' set to nil.
The overlay indicating that recursive minibuffers are not allowed
should appear right after the user input area, not at the end of
the candidate list and the cursor should stay at the front.

This is an `:around' advice for `minibuffer-message'. FUNC and
ARGS are standard as in all `:around' advice.

(fn FUNC &rest ARGS)" nil nil) (define-minor-mode selectrum-mode "Minor mode to use Selectrum for `completing-read'." :global t (if selectrum-mode (progn (selectrum-mode -1) (setq selectrum-mode t) (setq selectrum--old-completing-read-function (default-value 'completing-read-function)) (setq-default completing-read-function #'selectrum-completing-read) (setq selectrum--old-read-buffer-function (default-value 'read-buffer-function)) (setq-default read-buffer-function #'selectrum-read-buffer) (setq selectrum--old-read-file-name-function (default-value 'read-file-name-function)) (setq-default read-file-name-function #'selectrum-read-file-name) (setq selectrum--old-completion-in-region-function (default-value 'completion-in-region-function)) (when selectrum-complete-in-buffer (setq-default completion-in-region-function #'selectrum-completion-in-region)) (advice-add #'completing-read-multiple :override #'selectrum-completing-read-multiple) (advice-add 'dired-read-dir-and-switches :around #'selectrum--fix-dired-read-dir-and-switches) (advice-add 'read-library-name :override #'selectrum-read-library-name) (advice-add #'minibuffer-message :around #'selectrum--fix-minibuffer-message) (define-key minibuffer-local-map [remap previous-matching-history-element] 'selectrum-select-from-history)) (when (equal (default-value 'completing-read-function) #'selectrum-completing-read) (setq-default completing-read-function selectrum--old-completing-read-function)) (when (equal (default-value 'read-buffer-function) #'selectrum-read-buffer) (setq-default read-buffer-function selectrum--old-read-buffer-function)) (when (equal (default-value 'read-file-name-function) #'selectrum-read-file-name) (setq-default read-file-name-function selectrum--old-read-file-name-function)) (when (equal (default-value 'completion-in-region-function) #'selectrum-completion-in-region) (setq-default completion-in-region-function selectrum--old-completion-in-region-function)) (advice-remove #'completing-read-multiple #'selectrum-completing-read-multiple) (advice-remove 'dired-read-dir-and-switches #'selectrum--fix-dired-read-dir-and-switches) (advice-remove 'read-library-name #'selectrum-read-library-name) (advice-remove #'minibuffer-message #'selectrum--fix-minibuffer-message) (when (eq (lookup-key minibuffer-local-map [remap previous-matching-history-element]) #'selectrum-select-from-history) (define-key minibuffer-local-map [remap previous-matching-history-element] nil)))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "selectrum" '("selectrum-"))) (provide 'selectrum-autoloads)) "smooth-scrolling" ((smooth-scrolling-autoloads smooth-scrolling) (defvar smooth-scrolling-mode nil "Non-nil if Smooth-Scrolling mode is enabled.
See the `smooth-scrolling-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `smooth-scrolling-mode'.") (custom-autoload 'smooth-scrolling-mode "smooth-scrolling" nil) (autoload 'smooth-scrolling-mode "smooth-scrolling" "Make emacs scroll smoothly

If called interactively, enable Smooth-Scrolling mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

(fn &optional ARG)" t nil) (defvar smooth-scroll-margin 10 "Number of lines of visible margin at the top and bottom of a window.
If the point is within these margins, then scrolling will occur
smoothly for `previous-line' at the top of the window, and for
`next-line' at the bottom.

This is very similar in its goal to `scroll-margin'.  However, it
is implemented by activating `smooth-scroll-down' and
`smooth-scroll-up' advise via `defadvice' for `previous-line' and
`next-line' respectively.  As a result it avoids problems
afflicting `scroll-margin', such as a sudden jump and unexpected
highlighting of a region when the mouse is clicked in the margin.

Scrolling only occurs when the point is closer to the window
boundary it is heading for (top or bottom) than the middle of the
window.  This is to intelligently handle the case where the
margins cover the whole buffer (e.g. `smooth-scroll-margin' set
to 5 and `window-height' returning 10 or less).

See also `smooth-scroll-strict-margins'.") (custom-autoload 'smooth-scroll-margin "smooth-scrolling" t) (defvar smooth-scroll-strict-margins t "If true, the advice code supporting `smooth-scroll-margin'
will use `count-screen-lines' to determine the number of
*visible* lines between the point and the window top/bottom,
rather than `count-lines' which obtains the number of actual
newlines.  This is because there might be extra newlines hidden
by a mode such as folding-mode, outline-mode, org-mode etc., or
fewer due to very long lines being displayed wrapped when
`truncate-lines' is nil.

However, using `count-screen-lines' can supposedly cause
performance issues in buffers with extremely long lines.  Setting
`cache-long-line-scans' may be able to address this;
alternatively you can set this variable to nil so that the advice
code uses `count-lines', and put up with the fact that sometimes
the point will be allowed to stray into the margin.") (custom-autoload 'smooth-scroll-strict-margins "smooth-scrolling" t) (autoload 'enable-smooth-scroll-for-function "smooth-scrolling" "Define advice on FUNC to do smooth scrolling.

This adds after advice with name `smooth-scroll' to FUNC.

Note that the advice will not have an effect unless
`smooth-scrolling-mode' is enabled.

(fn FUNC)" nil t) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "smooth-scrolling" '("disable-smooth-scroll-for-function" "do-smooth-scroll" "enable-smooth-scroll-for-function-conditionally" "smooth-scroll-" "window-is-at-bob-p"))) (provide 'smooth-scrolling-autoloads)) "spacemacs-theme" ((spacemacs-theme-autoloads spacemacs-common spacemacs-dark-theme spacemacs-light-theme spacemacs-theme-pkg) (when load-file-name (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name)))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "spacemacs-common" '("create-spacemacs-theme" "spacemacs-theme-" "true-color-p"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "spacemacs-dark-theme" '("spacemacs-dark"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "spacemacs-light-theme" '("spacemacs-light"))) (provide 'spacemacs-theme-autoloads)) "prescient" ((prescient prescient-autoloads) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "prescient" '("prescient-"))) (provide 'prescient-autoloads)) "selectrum-prescient" ((selectrum-prescient selectrum-prescient-autoloads) (defvar selectrum-prescient-mode nil "Non-nil if Selectrum-Prescient mode is enabled.
See the `selectrum-prescient-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `selectrum-prescient-mode'.") (custom-autoload 'selectrum-prescient-mode "selectrum-prescient" nil) (autoload 'selectrum-prescient-mode "selectrum-prescient" "Minor mode to use prescient.el in Selectrum menus.

If called interactively, enable Selectrum-Prescient mode if ARG
is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

(fn &optional ARG)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "selectrum-prescient" '("selectrum-prescient-"))) (provide 'selectrum-prescient-autoloads)) "consult" ((consult-compile consult-flymake consult-register consult-selectrum consult-vertico consult-imenu consult consult-icomplete consult-xref consult-autoloads consult-org) (autoload 'consult-completion-in-region "consult" "Use minibuffer completion as the UI for `completion-at-point'.

The function is called with 4 arguments: START END COLLECTION PREDICATE.
The arguments and expected return value are as specified for
`completion-in-region'. Use as a value for `completion-in-region-function'.

The function can be configured via `consult-customize'.

    (consult-customize consult-completion-in-region
                       :completion-styles (basic)
                       :cycle-threshold 3)

These configuration options are supported:

    * :cycle-threshold - Cycling threshold (def: `completion-cycle-threshold')
    * :completion-styles - Use completion styles (def: `completion-styles')
    * :require-match - Require matches when completing (def: nil)
    * :prompt - The prompt string shown in the minibuffer

(fn START END COLLECTION &optional PREDICATE)" nil nil) (autoload 'consult-completing-read-multiple "consult" "Enhanced replacement for `completing-read-multiple'.
See `completing-read-multiple' for the documentation of the arguments.

(fn PROMPT TABLE &optional PRED REQUIRE-MATCH INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" nil nil) (autoload 'consult-multi-occur "consult" "Improved version of `multi-occur' based on `completing-read-multiple'.

See `multi-occur' for the meaning of the arguments BUFS, REGEXP and NLINES.

(fn BUFS REGEXP &optional NLINES)" t nil) (autoload 'consult-outline "consult" "Jump to an outline heading, obtained by matching against `outline-regexp'.

This command supports narrowing to a heading level and candidate preview.
The symbol at point is added to the future history." t nil) (autoload 'consult-mark "consult" "Jump to a marker in MARKERS list (defaults to buffer-local `mark-ring').

The command supports preview of the currently selected marker position.
The symbol at point is added to the future history.

(fn &optional MARKERS)" t nil) (autoload 'consult-global-mark "consult" "Jump to a marker in MARKERS list (defaults to `global-mark-ring').

The command supports preview of the currently selected marker position.
The symbol at point is added to the future history.

(fn &optional MARKERS)" t nil) (autoload 'consult-line "consult" "Search for a matching line and jump to the line beginning.

The default candidate is the non-empty line next to point.
This command obeys narrowing. Optional INITIAL input can be provided.
The search starting point is changed if the START prefix argument is set.
The symbol at point and the last `isearch-string' is added to the future history.

(fn &optional INITIAL START)" t nil) (autoload 'consult-keep-lines "consult" "Select a subset of the lines in the current buffer with live preview.

The selected lines are kept and the other lines are deleted. When called
interactively, the lines selected are those that match the minibuffer input. In
order to match the inverse of the input, prefix the input with `! '. When
called from elisp, the filtering is performed by a FILTER function. This
command obeys narrowing.

FILTER is the filter function.
INITIAL is the initial input.

(fn &optional FILTER INITIAL)" t nil) (autoload 'consult-focus-lines "consult" "Hide or show lines using overlays.

The selected lines are shown and the other lines hidden. When called
interactively, the lines selected are those that match the minibuffer input. In
order to match the inverse of the input, prefix the input with `! '. With
optional prefix argument SHOW reveal the hidden lines. Alternatively the
command can be restarted to reveal the lines. When called from elisp, the
filtering is performed by a FILTER function. This command obeys narrowing.

FILTER is the filter function.
INITIAL is the initial input.

(fn &optional SHOW FILTER INITIAL)" t nil) (autoload 'consult-goto-line "consult" "Read line number and jump to the line with preview.

Jump directly if a line number is given as prefix ARG. The command respects
narrowing and the settings `consult-goto-line-numbers' and
`consult-line-numbers-widen'.

(fn &optional ARG)" t nil) (autoload 'consult-recent-file "consult" "Find recent using `completing-read'." t nil) (autoload 'consult-file-externally "consult" "Open FILE externally using the default application of the system.

(fn FILE)" t nil) (autoload 'consult-mode-command "consult" "Run a command from any of the given MODES.

If no MODES are specified, use currently active major and minor modes.

(fn &rest MODES)" t nil) (autoload 'consult-yank-from-kill-ring "consult" "Select STRING from the kill ring and insert it.
With prefix ARG, put point at beginning, and mark at end, like `yank' does.

This command behaves like `yank-from-kill-ring' in Emacs 28, which also offers
a `completing-read' interface to the `kill-ring'. Additionally the Consult
version supports preview of the selected string.

(fn STRING &optional ARG)" t nil) (autoload 'consult-yank-pop "consult" "If there is a recent yank act like `yank-pop'.

Otherwise select string from the kill ring and insert it.
See `yank-pop' for the meaning of ARG.

This command behaves like `yank-pop' in Emacs 28, which also offers a
`completing-read' interface to the `kill-ring'. Additionally the Consult
version supports preview of the selected string.

(fn &optional ARG)" t nil) (autoload 'consult-yank-replace "consult" "Select STRING from the kill ring.

If there was no recent yank, insert the string.
Otherwise replace the just-yanked string with the selected string.

There exists no equivalent of this command in Emacs 28.

(fn STRING)" t nil) (autoload 'consult-bookmark "consult" "If bookmark NAME exists, open it, otherwise create a new bookmark with NAME.

The command supports preview of file bookmarks and narrowing. See the
variable `consult-bookmark-narrow' for the narrowing configuration.

(fn NAME)" t nil) (autoload 'consult-apropos "consult" "Select pattern and call `apropos'.

The default value of the completion is the symbol at point." t nil) (autoload 'consult-complex-command "consult" "Select and evaluate command from the command history.

This command can act as a drop-in replacement for `repeat-complex-command'." t nil) (autoload 'consult-history "consult" "Insert string from HISTORY of current buffer.

In order to select from a specific HISTORY, pass the history variable as argument.

(fn &optional HISTORY)" t nil) (autoload 'consult-isearch "consult" "Read a search string with completion from history.

This replaces the current search string if Isearch is active, and
starts a new Isearch session otherwise." t nil) (autoload 'consult-minor-mode-menu "consult" "Enable or disable minor mode.

This is an alternative to `minor-mode-menu-from-indicator'." t nil) (autoload 'consult-theme "consult" "Disable current themes and enable THEME from `consult-themes'.

The command supports previewing the currently selected theme.

(fn THEME)" t nil) (autoload 'consult-buffer "consult" "Enhanced `switch-to-buffer' command with support for virtual buffers.

The command supports recent files, bookmarks, views and project files as virtual
buffers. Buffers are previewed. Furthermore narrowing to buffers (b), files (f),
bookmarks (m) and project files (p) is supported via the corresponding keys. In
order to determine the project-specific files and buffers, the
`consult-project-root-function' is used. See `consult-buffer-sources' and
`consult--multi' for the configuration of the virtual buffer sources." t nil) (autoload 'consult-buffer-other-window "consult" "Variant of `consult-buffer' which opens in other window." t nil) (autoload 'consult-buffer-other-frame "consult" "Variant of `consult-buffer' which opens in other frame." t nil) (autoload 'consult-kmacro "consult" "Run a chosen keyboard macro.

With prefix ARG, run the macro that many times.
Macros containing mouse clicks are omitted.

(fn ARG)" t nil) (autoload 'consult-grep "consult" "Search for regexp with grep in DIR with INITIAL input.

The input string is split, the first part of the string is passed to
the asynchronous grep process and the second part of the string is
passed to the completion-style filtering. The input string is split at
a punctuation character, which is given as the first character of the
input string. The format is similar to Perl-style regular expressions,
e.g., /regexp/. Furthermore command line options can be passed to
grep, specified behind --.

Example: #async-regexp -- grep-opts#filter-string

The symbol at point is added to the future history. If `consult-grep'
is called interactively with a prefix argument, the user can specify
the directory to search in. By default the project directory is used
if `consult-project-root-function' is defined and returns non-nil.
Otherwise the `default-directory' is searched.

(fn &optional DIR INITIAL)" t nil) (autoload 'consult-git-grep "consult" "Search for regexp with grep in DIR with INITIAL input.

See `consult-grep' for more details.

(fn &optional DIR INITIAL)" t nil) (autoload 'consult-ripgrep "consult" "Search for regexp with rg in DIR with INITIAL input.

See `consult-grep' for more details.

(fn &optional DIR INITIAL)" t nil) (autoload 'consult-find "consult" "Search for regexp with find in DIR with INITIAL input.

The find process is started asynchronously, similar to `consult-grep'.
See `consult-grep' for more details regarding the asynchronous search.

(fn &optional DIR INITIAL)" t nil) (autoload 'consult-locate "consult" "Search for regexp with locate with INITIAL input.

The locate process is started asynchronously, similar to `consult-grep'.
See `consult-grep' for more details regarding the asynchronous search.

(fn &optional INITIAL)" t nil) (autoload 'consult-man "consult" "Search for regexp with man with INITIAL input.

The man process is started asynchronously, similar to `consult-grep'.
See `consult-grep' for more details regarding the asynchronous search.

(fn &optional INITIAL)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult" '("consult-"))) (autoload 'consult-compile-error "consult-compile" "Jump to a compilation error in the current buffer.

This command collects entries from compilation buffers and grep
buffers related to the current buffer.  The command supports
preview of the currently selected error." t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-compile" '("consult-compile--"))) (autoload 'consult-flymake "consult-flymake" "Jump to Flymake diagnostic." t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-flymake" '("consult-flymake--"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-icomplete" '("consult-icomplete--refresh"))) (autoload 'consult-imenu "consult-imenu" "Select item from flattened `imenu' using `completing-read' with preview.

The command supports preview and narrowing. See the variable
`consult-imenu-config', which configures the narrowing.

See also `consult-imenu-project'." t nil) (autoload 'consult-imenu-project "consult-imenu" "Select item from the imenus of all buffers from the same project.

In order to determine the buffers belonging to the same project, the
`consult-project-root-function' is used. Only the buffers with the
same major mode as the current buffer are used. See also
`consult-imenu' for more details." t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-imenu" '("consult-imenu-"))) (autoload 'consult-org-heading "consult-org" "Jump to an Org heading.

MATCH and SCOPE are as in `org-map-entries' and determine which
entries are offered.  By default, all entries of the current
buffer are offered.

(fn &optional MATCH SCOPE)" t nil) (autoload 'consult-org-agenda "consult-org" "Jump to an Org agenda heading.

By default, all agenda entries are offered. MATCH is as in
`org-map-entries' and can used to refine this.

(fn &optional MATCH)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-org" '("consult-org--"))) (autoload 'consult-register-window "consult-register" "Enhanced drop-in replacement for `register-preview'.

BUFFER is the window buffer.
SHOW-EMPTY must be t if the window should be shown for an empty register list.

(fn BUFFER &optional SHOW-EMPTY)" nil nil) (autoload 'consult-register-format "consult-register" "Enhanced preview of register REG.

This function can be used as `register-preview-function'.

(fn REG)" nil nil) (autoload 'consult-register "consult-register" "Load register and either jump to location or insert the stored text.

This command is useful to search the register contents. For quick access to
registers it is still recommended to use the register functions
`consult-register-load' and `consult-register-store' or the built-in built-in
register access functions. The command supports narrowing, see
`consult-register-narrow'. Marker positions are previewed. See
`jump-to-register' and `insert-register' for the meaning of prefix ARG.

(fn &optional ARG)" t nil) (autoload 'consult-register-load "consult-register" "Do what I mean with a REG.

For a window configuration, restore it. For a number or text, insert it. For a
location, jump to it. See `jump-to-register' and `insert-register' for the
meaning of prefix ARG.

(fn REG &optional ARG)" t nil) (autoload 'consult-register-store "consult-register" "Store register dependent on current context, showing an action menu.

With an active region, store/append/prepend the contents, optionally deleting
the region when a prefix ARG is given. With a numeric prefix ARG, store/add the
number. Otherwise store point, frameset, window or kmacro.

(fn ARG)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-register" '("consult-register-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-selectrum" '("consult-selectrum--"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-vertico" '("consult-vertico--"))) (autoload 'consult-xref "consult-xref" "Show xrefs with preview in the minibuffer.

This function can be used for `xref-show-xrefs-function'.
See `xref-show-xrefs-function' for the description of the
FETCHER and ALIST arguments.

(fn FETCHER &optional ALIST)" nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "consult-xref" '("consult-xref--"))) (provide 'consult-autoloads)) "rainbow-delimiters" ((rainbow-delimiters-autoloads rainbow-delimiters) (autoload 'rainbow-delimiters-mode "rainbow-delimiters" "Highlight nested parentheses, brackets, and braces according to their depth.

If called interactively, enable Rainbow-Delimiters mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

(fn &optional ARG)" t nil) (autoload 'rainbow-delimiters-mode-enable "rainbow-delimiters" "Enable `rainbow-delimiters-mode'." nil nil) (autoload 'rainbow-delimiters-mode-disable "rainbow-delimiters" "Disable `rainbow-delimiters-mode'." nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rainbow-delimiters" '("rainbow-delimiters-"))) (provide 'rainbow-delimiters-autoloads)) "paredit" ((paredit paredit-autoloads) (autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code.
With a prefix argument, enable Paredit Mode even if there are
  unbalanced parentheses in the buffer.
Paredit behaves badly if parentheses are unbalanced, so exercise
  caution when forcing Paredit Mode to be enabled, and consider
  fixing unbalanced parentheses instead.
\\<paredit-mode-map>

If called interactively, enable Paredit mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

(fn &optional ARG)" t nil) (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "paredit" '("?\\" "disable-paredit-mode" "paredit-"))) (provide 'paredit-autoloads)) "vterm" ((vterm vterm-autoloads) (autoload 'vterm-module-compile "vterm" "Compile vterm-module." t nil) (autoload 'vterm-next-error-function "vterm" "Advance to the next error message and visit the file where the error was.
This is the value of `next-error-function' in Compilation
buffers.  Prefix arg N says how many error messages to move
forwards (or backwards, if negative).

Optional argument RESET clears all the errors.

(fn N &optional RESET)" t nil) (autoload 'vterm "vterm" "Create an interactive Vterm buffer.
Start a new Vterm session, or switch to an already active
session.  Return the buffer selected (or created).

With a nonnumeric prefix arg, create a new session.

With a string prefix arg, create a new session with arg as buffer name.

With a numeric prefix arg (as in `C-u 42 M-x vterm RET'), switch
to the session with that number, or create it if it doesn't
already exist.

The buffer name used for Vterm sessions is determined by the
value of `vterm-buffer-name'.

(fn &optional ARG)" t nil) (autoload 'vterm-other-window "vterm" "Create an interactive Vterm buffer in another window.
Start a new Vterm session, or switch to an already active
session.  Return the buffer selected (or created).

With a nonnumeric prefix arg, create a new session.

With a string prefix arg, create a new session with arg as buffer name.

With a numeric prefix arg (as in `C-u 42 M-x vterm RET'), switch
to the session with that number, or create it if it doesn't
already exist.

The buffer name used for Vterm sessions is determined by the
value of `vterm-buffer-name'.

(fn &optional ARG)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vterm" '("vterm-"))) (provide 'vterm-autoloads)) "undo-tree" ((undo-tree undo-tree-autoloads) (autoload 'undo-tree-mode "undo-tree" "Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

If called interactively, enable Undo-Tree mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-mode-map}

(fn &optional ARG)" t nil) (put 'global-undo-tree-mode 'globalized-minor-mode t) (defvar global-undo-tree-mode nil "Non-nil if Global Undo-Tree mode is enabled.
See the `global-undo-tree-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.") (custom-autoload 'global-undo-tree-mode "undo-tree" nil) (autoload 'global-undo-tree-mode "undo-tree" "Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.
See `undo-tree-mode' for more information on Undo-Tree mode.

(fn &optional ARG)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "undo-tree" '("*undo-tree-id-counter*" "buffer-undo-tree" "turn-on-undo-tree-mode" "undo-"))) (provide 'undo-tree-autoloads))))

#s(hash-table size 65 test eq rehash-size 1.5 rehash-threshold 0.8125 data (org-elpa #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 9 "melpa" nil "gnu-elpa-mirror" nil "el-get" nil "emacsmirror-mirror" nil "straight" nil "evil" nil "goto-chg" nil "cl-lib" nil "selectrum" nil "smooth-scrolling" nil "spacemacs-theme" nil "prescient" nil "selectrum-prescient" nil "consult" nil "rainbow-delimiters" nil "paredit" nil "vterm" nil "undo-tree" nil)) melpa #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 2 "gnu-elpa-mirror" nil "el-get" (el-get :type git :flavor melpa :files ("*.el" ("recipes" "recipes/el-get.rcp") "methods" "el-get-pkg.el") :host github :repo "dimitri/el-get") "emacsmirror-mirror" nil "straight" nil "evil" (evil :type git :flavor melpa :files (:defaults "doc/build/texinfo/evil.texi" (:exclude "evil-test-helpers.el") "evil-pkg.el") :host github :repo "emacs-evil/evil") "goto-chg" (goto-chg :type git :flavor melpa :host github :repo "emacs-evil/goto-chg") "cl-lib" nil "selectrum" (selectrum :type git :flavor melpa :host github :repo "raxod502/selectrum") "smooth-scrolling" (smooth-scrolling :type git :flavor melpa :host github :repo "aspiers/smooth-scrolling") "spacemacs-theme" (spacemacs-theme :type git :flavor melpa :host github :repo "nashamri/spacemacs-theme") "prescient" (prescient :type git :flavor melpa :files ("prescient.el" "prescient-pkg.el") :host github :repo "raxod502/prescient.el") "selectrum-prescient" (selectrum-prescient :type git :flavor melpa :files ("selectrum-prescient.el" "selectrum-prescient-pkg.el") :host github :repo "raxod502/prescient.el") "consult" (consult :type git :flavor melpa :host github :repo "minad/consult") "rainbow-delimiters" (rainbow-delimiters :type git :flavor melpa :host github :repo "Fanael/rainbow-delimiters") "paredit" (paredit :type git :flavor melpa :files ("paredit.el" "paredit-pkg.el") :repo "https://mumble.net/~campbell/git/paredit.git") "vterm" (vterm :type git :flavor melpa :files ("*" (:exclude ".dir-locals.el" ".gitignore" ".clang-format" ".travis.yml") "vterm-pkg.el") :host github :repo "akermu/emacs-libvterm") "undo-tree" nil)) gnu-elpa-mirror #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 3 "emacsmirror-mirror" nil "straight" nil "cl-lib" nil "undo-tree" (undo-tree :type git :host github :repo "emacs-straight/undo-tree" :files ("*" (:exclude ".git"))))) el-get #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 1 "emacsmirror-mirror" nil "straight" nil "cl-lib" nil)) emacsmirror-mirror #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 2 "straight" (straight :type git :host github :repo "emacsmirror/straight") "cl-lib" nil))))

("org-elpa" "melpa" "gnu-elpa-mirror" "el-get" "emacsmirror-mirror" "straight" "emacs" "evil" "goto-chg" "cl-lib" "undo-tree" "selectrum" "prescient" "selectrum-prescient" "consult" "rainbow-delimiters" "paredit" "vterm" "smooth-scrolling" "spacemacs-theme")

t
