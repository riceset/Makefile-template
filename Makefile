# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/17 01:03:07 by tkomeno           #+#    #+#              #
#    Updated: 2022/09/17 01:33:01 by tkomeno          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = test
LIBFT = libft.a
INCLUDES = -I ./includes -I ./libft/includes
CFLAGS = -Wall -Wextra -Werror

SRCS = main.c
OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(LIBFT) $(OBJS)
	$(CC) $(INCLUDES) $(OBJS) -L./libft -lft

%.o:%.c
	$(CC) $(INCLUDES) -c $<

clean:
	$(RM) $(OBJS)
	$(MAKE) clean -C ./libft

fclean: clean
	$(RM) $(NAME)
	$(MAKE) fclean -C ./libft

re: fclean all

$(LIBFT):
	$(MAKE) -C ./libft

.PHONY: all clean fclean re
