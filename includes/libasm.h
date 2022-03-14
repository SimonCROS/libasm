#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

typedef struct s_list {
	void *data;
	struct s_list *next;
} t_list;

/*** Mandatory part *************************************************************/

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int	ft_strcmp(const char *s1, const char *s2);
char	*ft_strdup(const char *s1);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);

/*** Bonus part *****************************************************************/

int	ft_atoi_base(char *str, char *base);
void	ft_list_push_front(t_list **begin_list, void *data);
int	ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)(t_list *, t_list *));
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(t_list *, t_list *), void (*free_fct)(void *));

#endif
