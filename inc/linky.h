/*
 * Author -- Meevs
 * Creation Date -- Sat Oct  3 12:24:17 2020
 * File Name -- linky.h
 * Notes -- 
 */

#ifndef __LINKY__
#define __LINKY__

#include <stdlib.h>
#include <stdio.h>

struct linky
{
  void *data;

  struct linky *next;
  struct linky *prev;
};

#define linkyAddNode(list, data)					\
  {									\
    _Pragma ("GCC diagnostic push")					\
      _Pragma ("GCC diagnostic ignored \"-Wint-to-pointer-cast\"")	\
      _Pragma ("GCC diagnostic ignored \"-Wpointer-to-int-cast\"")	\
      _Generic (data,							\
		char: linkyAddChar (&list, (char)data),			\
		short: linkyAddShort (&list, (short)data),		\
		int: linkyAddInt (&list, (int)data),			\
		long: linkyAddLong (&list, (long)data),			\
    default: linkyAddBase (&list, (void *)data));			\
    _Pragma ("GCC diagnostic pop")					\
      }

#define linkyGetData(linky, type) (*((type *) linky->data))

struct linky **linkyAppendToList (struct linky **list);
struct linky **linkyFindEndOfList (struct linky **list);
struct linky *linkyAddChar (struct linky **list, char data);
struct linky *linkyAddShort (struct linky **list, short data);
struct linky *linkyAddInt (struct linky **list, int data);
struct linky *linkyAddLong (struct linky **list, long data);
struct linky *linkyAddBase (struct linky **list, void *data);
void linkyDestroyList (struct linky *list);

#endif
