# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: robert0 <fripponsupersonique@42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/31 23:07:04 by robert0           #+#    #+#              #
#    Updated: 2018/06/04 17:59:51 by robert0          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SUFFIXES:
.PHONY: all clean fclean re

###############################
# Fill with your informations #
###############################

NAME = libft.a
CFLAGS = -Wall -Werror -Wextra

SOURCESFOLD = ./srcs
HEADERSFOLD = ./includes
OBJECTSFOLD = ./objs

SOURCEFILES = ft_putchar.c  \
               ft_putstr.c  \
               ft_strlen.c  \
               ft_strcmp.c  \
               ft_swap.c 

###############
# End filling #
###############

SOURCES = $(patsubst %.c, $(SOURCESFOLD)/%.c, $(SOURCEFILES))
OBJECTFILES = $(SOURCEFILES:.c=.o)
OBJECTS = $(patsubst %.o, $(OBJECTSFOLD)/%.o, $(OBJECTFILES))

all: $(NAME)

$(NAME): $(OBJECTS)
    ar rc $(NAME) $(OBJECTS)
    ranlib $(NAME)

$(OBJECTSFOLD)/%.o: $(SOURCESFOLD)/%.c
    gcc -c $^ -I$(HEADERSFOLD) -o $@
    
clean:
    /bin/rm -f $(OBJECTS)

fclean: clean
    /bin/rm -f $(NAME)

re: fclean all
