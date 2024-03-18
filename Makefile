NAME       = pipex 
CC         = cc
CFLAGS     = -Wall -Wextra -Werror
DFLAGS     = -g -fsanitize=address
INCLUDE    = -I$(HDR_DIR)
HDR_LIST   = *.h
HDR_DIR    = ./includes/
HDR        = $(addprefix $(HDR_DIR), $(HDR_LIST))
SRCS       = *.c
SRCS_DIR   = ./srcs/
OBJ_DIR    = ./obj/
OBJS       = $(addprefix $(OBJ_DIR),$(SRCS:.c=.o))

$(NAME): $(OBJS) 
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(INCLUDE)

debug: $(OBJS)
	$(CC) $(CFLAGS) $(DFLAGS) $(OBJS) -o $(NAME) $(INCLUDE)

all: $(NAME)

$(OBJ_DIR)%.o: $(SRCS_DIR)%.c $(HDR)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) $(LIBFT)

re: fclean all

.PHONY: all clean fclean re 