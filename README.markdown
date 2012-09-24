crone
=====

This is the reference distribution for `crone`, a simple cron-like facility
written in Erlang.  Unlike most crons, it does not periodically wake up
and run whatever tasks are due to run; instead, it calculates the amount
of time between now and when the next task is due to run, and sleeps
exactly that long.

`crone` differs from `cron` in the following ways:

-   `crone` does not support multiple users. Of course, individual users
    may run their own copies of `crone` as desired.
-   No configuration files are used. `crone` is simply started with a
    list of task descriptions. These could easily be stored in a file to
    be read with `file:consult/1` if desired.
-   `crone` launches, not system executables, but Erlang functions. Of
    course, system programs can be launched with the Erlang function
    `os:cmd/1`.
-   The synax of a task description is quite different from `crontab`.
    It is (in this author's opinion) easier to read and is much more in
    keeping with the Erlang tradition. It is not quite as expressive as
    `cron` but this can be compensated for by adding multiple tasks.
-   No output is logged or mailed to anyone. If you want output to be
    logged or mailed, you must explicitly specify that as part of the
    task.
-   `crone` does not poll the system on a minute-by-minute basis like
    `cron` does. Each task is assigned to a single (Erlang) process. The
    time until it is to run next is calculated, and the process sleeps
    for exactly that long.
-   Unlike `cron`'s one-minute resolution, `crone` has a 2-second
    resolution (actually 1 second, but after running the task, the
    process waits an extra second to avoid accidentally running it more
    than once.)
-   Because it does not wake up every minute, and because it does not
    have a fixed configuration file, `crone` must be stopped and
    restarted if the user wishes to change the scheduled tasks.
-   `crone` does not handle Daylight Savings Time (or other cases when
    the system clock is altered) gracefully, and it is recommended that
    it be stopped and restarted on such occasions.

Usage
-----

To build the `crone` module, run the script `make.sh`.  Then import the
`crone` module in some Erlang code and use it as you see fit.

Documentation for the `crone` module's API can be found in the source,
`crone.erl`.  Stand-alone HTML documentation can also be extracted from
the source with `edoc`.
