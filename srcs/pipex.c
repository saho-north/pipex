
typedef enum e_cmd_type
{
    CMD,
    REDIR,
    PIPE
}               t_cmd_type;

typedef struct s_cmd
{
   enum e_cmd_type type;

}               t_cmd;

typedef struct s_pipex
{
    enum e_cmd_type type;
    //int     fd[2];
    int     pid;
    // char    **cmd;
    // char    **env;
    // char    *file;
}               t_pipex;

void    fork1(t_pipex *pipex)
{
    if (pipe(pipex->fd) == -1)
        exit(1);
    pipex->pid = fork();
    if (pipex->pid == -1)
        exit(1);
}

void    pipex(t_pipex *pipex, char **argv)
{
    pipex->file = argv[1];
    pipex->cmd = ft_split(argv[2], ' ');
    pipex->env = ft_split(argv[3], ' ');
    fork1(pipex);
    if (pipex->pid == 0)
        child_process(pipex);
    else
        parent_process(pipex);

    // int     fd[2];
    // int     pid;

    t_pipex pipex;
    // if (argc != 5)
    //     return (1);
    // if (pipe(fd) == -1)
    //     return (1);
    // pid = fork();
    // if (pid == -1)
    //     return (1);
    // if (pid == 0)
    //     child_process(fd, argv);
    // else
    //     parent_process(fd, argv);
}

int     main(int argc, char **argv)
{
  
    return (0);
}