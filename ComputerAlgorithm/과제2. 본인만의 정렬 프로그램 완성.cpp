#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
int t_num;
int main()
{
	pid_t pid;

	pid = fork();

	if (pid < 0) {
		fprintf(stderr, "Fork Failed\n");
		return 1;
	}
	else if (pid == 0) {
		printf("I am the child %d\n", pid);
		execlp("\bin\ls", "ls", NULL);
		t_num += 5;
		printf("child:t_num=%d\n", t_num);
	}
	else {
		printf("I am the parent %d\n", pid);
		t_num += 5;
		printf("parent1: t_num=%d\n", t_num);
		wait(NULL);
		t_num += 5;
		printf("parent2:t_num=%d\n", t_num);
		printf("Child Complete\n");
	}
	return 0;
}