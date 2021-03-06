/* 
 * math.h
 *
 * Mathematical functions.
 *
 * This file is part of the Mingw32 package.
 *
 * Contributors:
 *  Created by Colin Peters <colin@bird.fu.is.saga-u.ac.jp>
 *
 *  THIS SOFTWARE IS NOT COPYRIGHTED
 *
 *  This source code is offered for use in the public domain. You may
 *  use, modify or distribute it freely.
 *
 *  This code is distributed in the hope that it will be useful but
 *  WITHOUT ANY WARRANTY. ALL WARRANTIES, EXPRESS OR IMPLIED ARE HEREBY
 *  DISCLAIMED. This includes but is not limited to warranties of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * $Revision: 1.6 $
 * $Author: navaraf $
 * $Date: 2003/12/26 09:52:37 $
 *
 */
/* added modfl */

#ifndef _MATH_H_
#define _MATH_H_

#include <msvcrt/crttypes.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * HUGE_VAL is returned by strtod when the value would overflow the
 * representation of 'double'. There are other uses as well.
 *
 * __imp__HUGE is a pointer to the actual variable _HUGE in
 * MSVCRT.DLL. If we used _HUGE directly we would get a pointer
 * to a thunk function.
 *
 * NOTE: The CRTDLL version uses _HUGE_dll instead.
 */
#ifdef _MSVCRT_LIB_
extern double*  __imp__HUGE;
#define HUGE_VAL    (*__imp__HUGE)
#else
/* CRTDLL */
extern double*  _HUGE_dll;
#define HUGE_VAL    (*_HUGE_dll)
#endif


struct _exception
{
    int type;
    char    *name;
    double  arg1;
    double  arg2;
    double  retval;
};

/*
 * Types for the above _exception structure.
 */

#define _DOMAIN     1   /* domain error in argument */
#define _SING       2   /* singularity */
#define _OVERFLOW   3   /* range overflow */
#define _UNDERFLOW  4   /* range underflow */
#define _TLOSS      5   /* total loss of precision */
#define _PLOSS      6   /* partial loss of precision */

/*
 * Exception types with non-ANSI names for compatibility.
 */

#ifndef __STRICT_ANSI__
#ifndef _NO_OLDNAMES

#define DOMAIN      _DOMAIN
#define SING        _SING
#define OVERFLOW    _OVERFLOW
#define UNDERFLOW   _UNDERFLOW
#define TLOSS       _TLOSS
#define PLOSS       _PLOSS

#endif  /* Not _NO_OLDNAMES */
#endif  /* Not __STRICT_ANSI__ */


double  sin (double x);
double  cos (double x);
double  tan (double x);
double  sinh (double x);
double  cosh (double x);
double  tanh (double x);
double  asin (double x);
double  acos (double x);
double  atan (double x);
double  atan2 (double y, double x);
double  exp (double x);
double  log (double x);
double  log10 (double x);
double  pow (double x, double y);
long double powl (long double x,long double y);
double  sqrt (double x);
double  ceil (double x);
double  floor (double x);
double  fabs (double x);
double  ldexp (double x, int n);
double  frexp (double x, int* exp);
double  modf (double x, double* ip);
long double modfl (long double x,long double* ip);
double  fmod (double x, double y);


#ifndef __STRICT_ANSI__

/* Complex number (for cabs) */
struct _complex
{
    double  x;  /* Real part */
    double  y;  /* Imaginary part */
};

double  _cabs (struct _complex x);
double  _hypot (double x, double y);
double  _j0 (double x);
double  _j1 (double x);
double  _jn (int n, double x);
double  _y0 (double x);
double  _y1 (double x);
double  _yn (int n, double x);

#endif  /* Not __STRICT_ANSI__ */

#ifdef __cplusplus
}
#endif


#ifdef __MSVCRT__
double  linkme_sin(double x);
double  linkme_cos(double x);
double  linkme_tan(double x);
double  linkme_sinh(double x);
double  linkme_cosh(double x);
double  linkme_tanh(double x);
double  linkme_asin(double x);
double  linkme_acos(double x);
double  linkme_atan(double x);
double  linkme_atan2(double y, double x);
double  linkme_exp(double x);
double  linkme_log(double x);
double  linkme_log10(double x);
double  linkme_pow(double x, double y);
long double  linkme_powl(long double x,long double y);
double  linkme_sqrt(double x);
double  linkme_ceil(double x);
double  linkme_floor(double x);
double  linkme_fabs(double x);
double  linkme_ldexp(double x, int n);
double  linkme_frexp(double x, int* exp);
double  linkme_modf(double x, double* ip);
long double linkme_modfl(long double x,long double* ip);
double  linkme_fmod(double x, double y);

/*
 * linkme_log2
 * linkme_floor
 * linkme_ldexp
 * linkme_pow
 */

#endif


#endif /* Not _MATH_H_ */

