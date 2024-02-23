NAME       = pipex
CC         = cc
CFLAGS     = -Wall -Wextra -Werror
LIBRARY    = -L$(LIBFT_DIR) -lft
INCLUDE    = -I$(HDR_DIR) -I$(LIBFT_DIR)includes/

LIBFT      = $(LIBFT_DIR)libft.a
LIBFT_DIR  = ./libft/

HDR_LIST  = *.h
HDR_DIR   = ./includes/
HDR       = $(addprefix $(HDR_DIR), $(HDR_LIST))

SRCS       = *.c
SRCS_DIR   = ./srcs/
OBJS       = $(addprefix $(SRCS_DIR), $(SRCS:.c=.o))

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LIBRARY) $(INCLUDE)

$(LIBFT):
	make -C $(LIBFT_DIR)

all: $(NAME)

%.o: %.c $(HDR)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	rm -f $(OBJS)
	make -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME) $(LIBFT)
	make -C $(LIBFT_DIR) fclean

re: fclean all

bonus: $(ALL)

.PHONY: all clean fclean re bonus