#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

#ifdef _MSC_VER
#pragma warning(disable:4700 4715 4716)
#endif

#if defined USE_64_BIT_INT || defined USE_LONG_DOUBLE
#ifndef _MSC_VER
#include <inttypes.h>
#endif
#endif

#ifdef OLDPERL
#define SvUOK SvIsUV
#endif

SV * Rmpz_init_set_str_nobless(SV * num, SV * base) {
     mpz_t * mpz_t_obj;
     unsigned long b = SvUV(base);
     SV * obj_ref, * obj;

     if(b == 1 || b > 62) croak("Second argument supplied to Rmpz_init_set_str_nobless() is not in acceptable range");

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_create function");
     if(mpz_init_set_str (*mpz_t_obj, SvPV_nolen(num), b))
        croak("First argument supplied to Rmpz_create_init_nobless() is not a valid base %u integer", b);

     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_init2_nobless(SV * bits) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init2_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init2 (*mpz_t_obj, SvUV(bits));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_init_nobless() {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init(*mpz_t_obj);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_nobless(mpz_t * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set(*mpz_t_obj, *p);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_ui_nobless(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_ui_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set_ui(*mpz_t_obj, SvUV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_si_nobless(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_si_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set_si(*mpz_t_obj, SvIV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}


SV * Rmpz_init_set_d_nobless(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_d_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set_d(*mpz_t_obj, SvNV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init() {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set(mpz_t * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set(*mpz_t_obj, *p);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_ui(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_ui function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set_ui(*mpz_t_obj, SvUV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_si(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_si function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set_si(*mpz_t_obj, SvIV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}


SV * Rmpz_init_set_d(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_d function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set_d(*mpz_t_obj, SvNV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * _Rmpz_init_set_ld(SV * p) {
#ifdef USE_LONG_DOUBLE
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
     char buffer[50];
     long double ld = (long double)SvNV(p) >= 0 ? floorl((long double)SvNV(p)) : ceill((long double)SvNV(p));
     
     sprintf(buffer, "%.0Lf", ld);

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in _Rmpz_init_set_ld function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set_str(*mpz_t_obj, buffer, 10);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
#else
     croak("_Rmpz_init_set_ld not implemented on this build of perl");
#endif
}


SV * Rmpz_init_set_str(SV * num, SV * base) {
     mpz_t * mpz_t_obj;
     unsigned long b = SvUV(base);
     SV * obj_ref, * obj;

     if(b == 1 || b > 62) croak("Second argument supplied to Rmpz_init_set_str() is not in acceptable range");

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_str function");
     if(mpz_init_set_str (*mpz_t_obj, SvPV_nolen(num), b))
        croak("First argument supplied to Rmpz_init_set_str() is not a valid base %u integer", b);

     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_init2(SV * bits) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init2 function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init2 (*mpz_t_obj, SvUV(bits));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_get_str(mpz_t * p, SV * base) {
     char * out;
     SV * outsv;
     int c = (int)SvIV(base), b = (int)SvIV(base);

     if((b > -2 && b < 2) || b < -36 || b > 62) croak("Second argument supplied to Rmpz_get_str() is not in acceptable range");

     if(c < 0) c *= -1;

     New(2, out, mpz_sizeinbase(*p, c) + 5, char);
     if(out == NULL) croak("Failed to allocate memory in Rmpz_deref function");

     mpz_get_str(out, b, *p);
     outsv = newSVpv(out, 0);
     Safefree(out);
     return outsv;
}

void DESTROY(mpz_t * p) {
/*     printf("Destroying mpz "); */
     mpz_clear(*p);
     Safefree(p);
/*     printf("...destroyed\n"); */
}

void Rmpz_clear(mpz_t * p) {
     mpz_clear(*p);
     Safefree(p);
}

void Rmpz_clear_mpz(mpz_t * p) {
     mpz_clear(*p);
}

void Rmpz_clear_ptr(mpz_t * p) {
     Safefree(p);
}

void Rmpz_realloc2(mpz_t * integer, SV * bits){
     mpz_realloc2(*integer, SvUV(bits));
}

void Rmpz_set(mpz_t * copy, mpz_t * original) {
     mpz_set(*copy, *original);
}

void Rmpz_set_q(mpz_t * copy, mpq_t * original) {
     mpz_set_q(*copy, *original);
}

void Rmpz_set_f(mpz_t * copy, mpf_t * original) {
     mpz_set_f(*copy, *original);
}

void Rmpz_set_si(mpz_t * copy, SV * original) {
     mpz_set_si(*copy, SvIV(original));
}

void Rmpz_set_ui(mpz_t * copy, SV * original) {
     mpz_set_ui(*copy, SvUV(original));
}

void Rmpz_set_d(mpz_t * copy, SV * original) {
     mpz_set_d(*copy, SvNV(original));
}

void Rmpz_set_str(mpz_t * copy, SV * original, SV * base) {
    if(SvUV(base) == 1 || SvUV(base) > 62) croak("Second argument supplied to Rmpz_set_str() is not in acceptable range");
    if(mpz_set_str(*copy, SvPV_nolen(original), SvUV(base)))
       croak("Second argument supplied to Rmpz_set_str() is not a valid base %u integer", SvUV(base));
}

void Rmpz_swap(mpz_t * a, mpz_t * b) {
     mpz_swap(*a, *b);
}

SV * Rmpz_get_ui(mpz_t * n) {
     return newSVuv(mpz_get_ui(*n));
}

SV * Rmpz_get_si(mpz_t * n) {
     return newSViv(mpz_get_si(*n));
}

SV * Rmpz_get_d(mpz_t * n) {
     return newSVnv(mpz_get_d(*n));
}

void Rmpz_get_d_2exp(mpz_t * n) {
     dXSARGS;
     double d;
     long exp, *expptr;

     expptr = &exp;
     d = mpz_get_d_2exp(expptr, *n);
 
     // sp = mark; // not needed
     EXTEND(SP, 2);
     ST(0) = sv_2mortal(newSVnv(d));
     ST(1) = sv_2mortal(newSVuv(exp));
     // PUTBACK; // not needed
     XSRETURN(2);
}

SV * Rmpz_getlimbn(mpz_t * p, SV * n) {
     return newSVuv(mpz_getlimbn(*p, SvUV(n)));
}

void Rmpz_add(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_add(*dest, *src1, *src2 );
}

void Rmpz_add_ui(mpz_t * dest, mpz_t * src, SV * num) {
     mpz_add_ui(*dest, *src, SvUV(num));
/*     return sv_setref_pv(newSViv(0), Nullch, INT2PTR(mpz_t *, SvIV(SvRV(dest)))); */ 
}

void Rmpz_sub(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_sub(*dest, *src1, *src2 );
}

void Rmpz_sub_ui(mpz_t * dest, mpz_t * src, SV * num) {
     mpz_sub_ui(*dest, *src, SvUV(num));
}

void Rmpz_ui_sub(mpz_t * dest, SV * num, mpz_t * src) {
     mpz_ui_sub(*dest, SvUV(num), *src);
}

void Rmpz_mul(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_mul(*dest, *src1, *src2 );
}

void Rmpz_mul_si(mpz_t * dest, mpz_t * src, SV * num) {
     mpz_mul_si(*dest, *src, SvIV(num));
}

void Rmpz_mul_ui(mpz_t * dest, mpz_t * src, SV * num) {
     mpz_mul_ui(*dest, *src, SvUV(num));
}

void Rmpz_addmul(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_addmul(*dest, *src1, *src2 );
}

void Rmpz_addmul_ui(mpz_t * dest, mpz_t * src, SV * num) {
     mpz_addmul_ui(*dest, *src, SvUV(num));
}

void Rmpz_submul(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_submul(*dest, *src1, *src2 );
}

void Rmpz_submul_ui(mpz_t * dest, mpz_t * src, SV * num) {
     mpz_submul_ui(*dest, *src, SvUV(num));
}

void Rmpz_mul_2exp(mpz_t * dest, mpz_t * src1, SV * b) {
     mpz_mul_2exp(*dest, *src1, SvUV(b));
}

void Rmpz_neg(mpz_t * dest, mpz_t * src) {
     mpz_neg(*dest, *src );
}

void Rmpz_abs(mpz_t * dest, mpz_t * src) {
     mpz_abs(*dest, *src );
}

void Rmpz_cdiv_q( mpz_t * q, mpz_t *  n, mpz_t * d) {
     mpz_cdiv_q(*q, *n, *d);
}

void Rmpz_cdiv_r( mpz_t * mod, mpz_t *  n, mpz_t * d) {
     mpz_cdiv_r(*mod, *n, *d);
}

void Rmpz_cdiv_qr( mpz_t * q, mpz_t * r, mpz_t *  n, mpz_t * d) {
     mpz_cdiv_qr(*q, *r, *n, *d);
}

SV * Rmpz_cdiv_q_ui( mpz_t * q, mpz_t *  n, SV * d) {
     return newSVuv(mpz_cdiv_q_ui(*q, *n, SvUV(d)));
}

SV * Rmpz_cdiv_r_ui( mpz_t * q, mpz_t *  n, SV * d) {
     return newSVuv(mpz_cdiv_r_ui(*q, *n, SvUV(d)));
}

SV * Rmpz_cdiv_qr_ui( mpz_t * q, mpz_t * r, mpz_t *  n, SV * d) {
     return newSVuv(mpz_cdiv_qr_ui(*q, *r, *n, SvUV(d)));
}

int Rmpz_cdiv_ui( mpz_t *  n, SV * d) {
    return mpz_cdiv_ui(*n, SvUV(d));
}

void Rmpz_cdiv_q_2exp( mpz_t * q, mpz_t *  n, SV * b) {
     mpz_cdiv_q_2exp(*q, *n, SvUV(b));
}

void Rmpz_cdiv_r_2exp( mpz_t * r, mpz_t *  n, SV * b) {
     mpz_cdiv_r_2exp(*r, *n, SvUV(b));
}

void Rmpz_fdiv_q( mpz_t * q, mpz_t *  n, mpz_t * d) {
     mpz_fdiv_q(*q, *n, *d);
}

/* % mpz-t (modulus) operator */
void Rmpz_fdiv_r( mpz_t * mod, mpz_t *  n, mpz_t * d) {
     mpz_fdiv_r(*mod, *n, *d);
}

void Rmpz_fdiv_qr( mpz_t * q, mpz_t * r, mpz_t *  n, mpz_t * d) {
     mpz_fdiv_qr(*q, *r, *n, *d);
}

SV * Rmpz_fdiv_q_ui( mpz_t * q, mpz_t *  n, SV * d) {
     return newSVuv(mpz_fdiv_q_ui(*q, *n, SvUV(d)));
}

SV * Rmpz_fdiv_r_ui( mpz_t * q, mpz_t *  n, SV * d) {
     return newSVuv(mpz_fdiv_r_ui(*q, *n, SvUV(d)));
}

SV * Rmpz_fdiv_qr_ui( mpz_t * q, mpz_t * r, mpz_t *  n, SV * d) {
     return newSVuv(mpz_fdiv_qr_ui(*q, *r, *n, SvUV(d)));
}

/* % int (modulus) operator */
int Rmpz_fdiv_ui( mpz_t *  n, SV * d) {
    return mpz_fdiv_ui(*n, SvUV(d));
}

void Rmpz_fdiv_q_2exp( mpz_t * q, mpz_t *  n, SV * b) {
     mpz_fdiv_q_2exp(*q, *n, SvUV(b));
}

void Rmpz_fdiv_r_2exp( mpz_t * r, mpz_t *  n, SV * b) {
     mpz_fdiv_r_2exp(*r, *n, SvUV(b));
}

void Rmpz_tdiv_q( mpz_t * q, mpz_t *  n, mpz_t * d) {
     mpz_tdiv_q(*q, *n, *d);
}

/* % mpz-t (modulus) operator */
void Rmpz_tdiv_r( mpz_t * mod, mpz_t *  n, mpz_t * d) {
     mpz_tdiv_r(*mod, *n, *d);
}

void Rmpz_tdiv_qr( mpz_t * q, mpz_t * r, mpz_t *  n, mpz_t * d) {
     mpz_tdiv_qr(*q, *r, *n, *d);
}

SV * Rmpz_tdiv_q_ui( mpz_t * q, mpz_t *  n, SV * d) {
     return newSVuv(mpz_tdiv_q_ui(*q, *n, SvUV(d)));
}

SV * Rmpz_tdiv_r_ui( mpz_t * q, mpz_t *  n, SV * d) {
     return newSVuv(mpz_tdiv_r_ui(*q, *n, SvUV(d)));
}

SV * Rmpz_tdiv_qr_ui( mpz_t * q, mpz_t * r, mpz_t *  n, SV * d) {
     return newSVuv(mpz_tdiv_qr_ui(*q, *r, *n, SvUV(d)));
}

/* % int (modulus) operator */
int Rmpz_tdiv_ui( mpz_t *  n, SV * d) {
    return mpz_tdiv_ui(*n, SvUV(d));
}

void Rmpz_tdiv_q_2exp( mpz_t * q, mpz_t *  n, SV * b) {
     mpz_tdiv_q_2exp(*q, *n, SvUV(b));
}

void Rmpz_tdiv_r_2exp( mpz_t * r, mpz_t *  n, SV * b) {
     mpz_tdiv_r_2exp(*r, *n, SvUV(b));
}

void Rmpz_mod( mpz_t * r, mpz_t *  n, mpz_t * d) {
     mpz_mod(*r, *n, *d);
}

SV * Rmpz_mod_ui( mpz_t * r, mpz_t *  n, SV * d) {
     return newSVuv(mpz_mod_ui(*r, *n, SvUV(d)));
}

void Rmpz_divexact(mpz_t * dest, mpz_t * n, mpz_t * d) {
     mpz_divexact(*dest, *n, *d );
}

void Rmpz_divexact_ui(mpz_t * dest, mpz_t * n, SV * d) {
     mpz_divexact_ui(*dest, *n, SvUV(d));
}

int Rmpz_divisible_p(mpz_t * n, mpz_t * d) {
    return mpz_divisible_p(*n, *d);
}

int Rmpz_divisible_ui_p(mpz_t * n, SV * d) {
    return mpz_divisible_ui_p(*n, SvUV(d));
}

int Rmpz_divisible_2exp_p(mpz_t * n, SV * b) {
    return mpz_divisible_2exp_p(*n, SvUV(b));
}

SV * Rmpz_congruent_p(mpz_t * n, mpz_t * c, mpz_t * d) {
     return newSViv(mpz_congruent_p(*n, *c, *d));
}

SV * Rmpz_congruent_ui_p(mpz_t * n, SV * c, SV * d) {
     return newSViv(mpz_congruent_ui_p(*n, SvUV(c), SvUV(d)));
}

SV * Rmpz_congruent_2exp_p(mpz_t * n, mpz_t * c, SV * d) {
     return newSViv(mpz_congruent_2exp_p(*n, *c, SvUV(d)));
}

void Rmpz_powm(mpz_t * dest, mpz_t * base, mpz_t * exp, mpz_t * mod) {
     mpz_powm(*dest, *base, *exp, *mod);
}

void Rmpz_powm_ui(mpz_t * dest, mpz_t * base, SV * exp, mpz_t * mod) {
     mpz_powm_ui(*dest, *base, SvUV(exp), *mod);
}

void Rmpz_pow_ui(mpz_t * dest, mpz_t * base, SV * exp) {
     mpz_pow_ui(*dest, *base, SvUV(exp));
}

void Rmpz_ui_pow_ui(mpz_t * dest, SV * base, SV * exp) {
     mpz_ui_pow_ui(*dest, SvUV(base), SvUV(exp));
}

SV * Rmpz_root(mpz_t * r, mpz_t * n, SV * d) {
     return newSViv(mpz_root(*r, *n, SvUV(d)));
}

void Rmpz_sqrt(mpz_t * r, mpz_t * n) {
     mpz_sqrt(*r, *n);
}

void Rmpz_sqrtrem(mpz_t * root, mpz_t * rem, mpz_t * src) {
     mpz_sqrtrem(*root, *rem, *src);
}

int Rmpz_perfect_power_p(mpz_t * in) {
    return mpz_perfect_power_p(*in);
}

int Rmpz_perfect_square_p(mpz_t * in) {
    return mpz_perfect_square_p(*in);
}

int Rmpz_probab_prime_p(mpz_t * cand, SV * reps) {
    return mpz_probab_prime_p(*cand, SvUV(reps));
}

void Rmpz_nextprime(mpz_t * prime, mpz_t * init) {
     mpz_nextprime(*prime, *init);
}

void Rmpz_gcd(mpz_t * gcd, mpz_t * src1, mpz_t * src2) {
     mpz_gcd(*gcd, *src1, *src2);
}

void Rmpz_gcd_ui(mpz_t * gcd, mpz_t * n, SV * d) {
     mpz_gcd_ui(*gcd, *n, SvUV(d));
}

void Rmpz_gcdext(mpz_t * g, mpz_t * s, mpz_t * t, mpz_t * a, mpz_t * b) {
     mpz_gcdext(*g, *s, *t, *a, *b);
}

void Rmpz_lcm(mpz_t * lcm, mpz_t * src1, mpz_t * src2) {
     mpz_lcm(*lcm, *src1, *src2);
}

void Rmpz_lcm_ui(mpz_t * lcm, mpz_t * src1, SV * src2) {
     mpz_lcm_ui(*lcm, *src1, SvUV(src2));
}

int Rmpz_invert(mpz_t * inv, mpz_t * src1, mpz_t * src2) {
    return mpz_invert(*inv, *src1, *src2);
}

int Rmpz_jacobi(mpz_t * a, mpz_t * b) {
    return mpz_jacobi(*a, *b);
}

int Rmpz_legendre(mpz_t * a, mpz_t * b) {
    return mpz_legendre(*a, *b);
}

int Rmpz_kronecker(mpz_t * a, mpz_t * b) {
    return mpz_kronecker(*a, *b);
}

int Rmpz_kronecker_si(mpz_t * a, SV * b) {
    return mpz_kronecker_si(*a, SvIV(b));
}

int Rmpz_kronecker_ui(mpz_t * a, SV * b) {
    return mpz_kronecker_ui(*a, SvUV(b));
}

int Rmpz_si_kronecker(SV * a, mpz_t * b) {
    return mpz_si_kronecker(SvIV(a), *b);
}

int Rmpz_ui_kronecker(SV * a, mpz_t * b) {
    return mpz_ui_kronecker(SvUV(a), *b);
}

SV * Rmpz_remove(mpz_t * rem, mpz_t * src1, mpz_t * src2) {
     return newSVuv(mpz_remove(*rem, *src1, *src2));
}

void Rmpz_fac_ui(mpz_t * fac, SV * b) {
     mpz_fac_ui(*fac, SvUV(b));
}

void Rmpz_bin_ui(mpz_t * dest, mpz_t * n, SV * d) {
     mpz_bin_ui(*dest, *n, SvUV(d));
}

void Rmpz_bin_uiui(mpz_t * dest, SV * n, SV * d) {
     mpz_bin_uiui(*dest, SvUV(n), SvUV(d));
}

void Rmpz_fib_ui(mpz_t * dest, SV * b) {
     mpz_fib_ui(*dest, SvUV(b));
}

void Rmpz_fib2_ui(mpz_t * fn, mpz_t * fnsub1, SV * b) {
     mpz_fib2_ui(*fn, *fnsub1, SvUV(b));
}

void Rmpz_lucnum_ui(mpz_t * dest, SV * b) {
     mpz_lucnum_ui(*dest, SvUV(b));
}

void Rmpz_lucnum2_ui(mpz_t * ln, mpz_t * lnsub1, SV * b) {
     mpz_lucnum2_ui(*ln, *lnsub1, SvUV(b));
}

int Rmpz_cmp(mpz_t * n, mpz_t * d) {
    return mpz_cmp(*n, *d );
}

int Rmpz_cmp_d(mpz_t * n, SV * d) {
    return mpz_cmp_d(*n, SvNV(d));
}

int Rmpz_cmp_si(mpz_t * n, SV * d) {
    return mpz_cmp_si(*n, SvIV(d));
}

int Rmpz_cmp_ui(mpz_t * n, SV * d) {
    return mpz_cmp_ui(*n, SvUV(d));
}

int Rmpz_cmpabs(mpz_t * n, mpz_t * d) {
    return mpz_cmpabs(*n, *d );
}

int Rmpz_cmpabs_d(mpz_t * n, SV * d) {
    return mpz_cmpabs_d(*n, SvNV(d));
}

int Rmpz_cmpabs_ui(mpz_t * n, SV * d) {
    return mpz_cmpabs_ui(*n, SvUV(d));
}

int Rmpz_sgn(mpz_t * n) {
    return mpz_sgn(*n);
}

void Rmpz_and(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_and(*dest, *src1, *src2 );
}

void Rmpz_ior(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_ior(*dest, *src1, *src2 );
}

void Rmpz_xor(mpz_t * dest, mpz_t * src1, mpz_t * src2) {
     mpz_xor(*dest, *src1, *src2 );
}

void Rmpz_com(mpz_t * dest, mpz_t * src) {
     mpz_com(*dest, *src );
}

int Rmpz_popcount(mpz_t * in) {
    return mpz_popcount(*in);
}

int Rmpz_hamdist(mpz_t * dest, mpz_t * src) {
     return mpz_hamdist(*dest, *src );
}

SV * Rmpz_scan0(mpz_t * n, SV * start_bit) {
    return newSVuv(mpz_scan0(*n, SvUV(start_bit)));
}

SV * Rmpz_scan1(mpz_t * n, SV * start_bit) {
    return newSVuv(mpz_scan1(*n, SvUV(start_bit)));
}

void Rmpz_setbit(mpz_t * num, SV * bit_index) {
     mpz_setbit(*num, SvUV(bit_index));
}

void Rmpz_clrbit(mpz_t * num, SV * bit_index) {
     mpz_clrbit(*num, SvUV(bit_index));
}

int Rmpz_tstbit(mpz_t * num, SV * bit_index) {
    return mpz_tstbit(*num, SvUV(bit_index));
}

/* Turn a binary string into an mpz_t */
void Rmpz_import(mpz_t * rop, SV * count, SV * order, SV * size, SV * endian, SV * nails, SV * op){
     mpz_import(*rop, SvUV(count), SvIV(order), SvIV(size), SvIV(endian), SvUV(nails), SvPV_nolen(op));
}

/* Return an mpz_t to a binary string */
SV * Rmpz_export(SV * order, SV * size, SV * endian, SV * nails, mpz_t * number) {
     SV * outsv;
     char * out;
     size_t * cptr, count;

     cptr = &count;
     count = mpz_sizeinbase(*number, 2);

     Newz(1, out, count / 8 + 7, char);
     if(out == NULL) croak("Failed to allocate memory in Rmpz_export function");
     
     mpz_export(out, cptr, SvIV(order), SvIV(size), SvIV(endian), SvIV(nails), *number);
     outsv = newSVpv(out, count);
     Safefree(out);
     return outsv;
}

int Rmpz_fits_ulong_p(mpz_t * in) {
    return mpz_fits_ulong_p(*in);
}

int Rmpz_fits_slong_p(mpz_t * in) {
    return mpz_fits_slong_p(*in);
}

int Rmpz_fits_uint_p(mpz_t * in) {
    return mpz_fits_uint_p(*in);
}

int Rmpz_fits_sint_p(mpz_t * in) {
    return mpz_fits_sint_p(*in);
}

int Rmpz_fits_ushort_p(mpz_t * in) {
    return mpz_fits_ushort_p(*in);
}

int Rmpz_fits_sshort_p(mpz_t * in) {
    return mpz_fits_sshort_p(*in);
}

int Rmpz_odd_p(mpz_t * in) {
    return mpz_odd_p(*in);
}

int Rmpz_even_p(mpz_t * in) {
    return mpz_even_p(*in);
}

SV * Rmpz_size(mpz_t * in) {
    return newSVuv(mpz_size(*in));
}

SV * Rmpz_sizeinbase(mpz_t * in, SV * base) {
    if(SvIV(base) < 2 || SvIV(base) > 62) croak("Rmpz_sizeinbase handles only bases in the range 2..62");
    return newSVuv(mpz_sizeinbase(*in, (int)SvIV(base)));
}

void Rsieve_gmp(int x_arg, int a, mpz_t *number) {
dXSARGS;
unsigned short *v, *addon, set[16] = {65534,65533,65531,65527,65519,65503,65471,65407,65279,65023,64511,63487,61439,57343,49151,32767};
unsigned long init, leap, abits, asize, i, size, b, imax, k, x = x_arg;

if(sizeof(short) != 2) croak("The sieve_gmp function is unsuitable for this architecture.\nContact the author and he may do something about it.");
if(a & 1) croak("max_add must be even in sieve_gmp function");
if(x & 1) croak("max_prime must be even in sieve_gmp function");

if(!mpz_tstbit(*number, 0)) croak("candidate must be odd in sieve_gmp function");

abits = (a / 2) + 1;

if(!(abits % 16)) asize = abits / 16;
else asize = (abits / 16) + 1;

Newz(1, addon, asize, unsigned short);
if(addon == NULL) croak("1: Unable to allocate memory in sieve_gmp function");

for(i = 0; i < asize; ++i) addon[i] = 65535;

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 16)) size = b / 16;
else size = (b / 16) + 1;

Newz(2, v, size, unsigned short);
if(v == NULL) croak("2: Unable to allocate memory in sieve_gmp function");

for(i = 1; i < size; ++i) v[i] = 65535;
v[0] = 65534;

for(i = 0; i <= imax; ++i) {
    
    if(v[i / 16] & (1 << (i % 16))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             v[k / 16] &= set[k % 16];
             k += leap;
             }
       }
}

size = 0;
sp = mark;

for(i = 0; i < b; ++i) {
    if(v[i / 16] & (1 << (i % 16))) {
      leap = 2 * i + 1;
        init = mpz_fdiv_ui(*number, leap);
      if(init) {
        if(init & 1) init = (leap - init) / 2;
        else init = leap - (init / 2);
        }
      while(init < abits) {
         addon[init / 16] &= set[init % 16];
         init += leap;
         }
      }
   }

Safefree(v);

for(i = 0; i < abits; ++i) {
    if(addon[i / 16] & (1 << (i % 16))) {
      XPUSHs(sv_2mortal(newSViv(2 * i)));
      ++size;
      }
   }

Safefree(addon);

PUTBACK;
XSRETURN(size);

}

int Rfermat_gmp(mpz_t * num, SV * base){
            mpz_t b, num_less_1;

    mpz_init_set_ui(b, SvUV(base));
    mpz_init_set(num_less_1, *num);
    mpz_sub_ui(num_less_1, num_less_1, 1);
    mpz_powm(b, b, num_less_1, *num);

    if(!mpz_cmp_si(b, 1)) {
       mpz_clear(b);
       mpz_clear(num_less_1);
       return 1;
       }

    mpz_clear(b);
    mpz_clear(num_less_1);
    return 0;
}

int Rrm_gmp(mpz_t * num, SV * base){
    mpz_t c_less, r, y, bb;
    unsigned long i, s = 0, b = SvUV(base);

    mpz_init(c_less);
    mpz_init(r);
    mpz_init(y);

    mpz_sub_ui(c_less, *num, 1);
    mpz_set(r, c_less);
    mpz_init_set_ui(bb, b);

    while(mpz_even_p(r)) {
          mpz_tdiv_q_2exp(r, r, 1);
          ++s;
          } 

    mpz_powm(y, bb, r, *num);
    mpz_clear(r);
    mpz_clear(bb);
    if(mpz_cmp_ui(y, 1) && mpz_cmp(y, c_less)) {
       for(i = 0; i < s; ++i) {
           mpz_powm_ui(y, y, 2, *num); 
           if(!mpz_cmp_ui(y, 1)) {
              mpz_clear(c_less);
              mpz_clear(y);
              return 0;
              }
           if(!mpz_cmp(y, c_less)) break;
           }
       if(mpz_cmp(y, c_less)) {
          mpz_clear(c_less);
          mpz_clear(y);
          return 0;
          }
       }

   mpz_clear(c_less);
   mpz_clear(y);
   return 1; 
}

void Rprbg_ms(mpz_t * outref, mpz_t * p, mpz_t * q, mpz_t * seed, int bits_required) {
     mpz_t n, phi, pless1, qless1, mod, keep;
     unsigned long e, k, bign, r, its, i, r_shift, check;
     double kdoub;
     gmp_randstate_t state;

     mpz_init(n);
     mpz_init(phi);
     mpz_init(pless1);
     mpz_init(qless1);

     mpz_sub_ui(qless1, *q, 1);
     mpz_sub_ui(pless1, *p, 1);

     mpz_mul(n, *p, *q);

     mpz_mul(phi, pless1, qless1);
     mpz_clear(pless1);
     mpz_clear(qless1);

     bign = mpz_sizeinbase(n, 2);
     e = bign / 80;

     while(1) {
        if(e < 1) croak("You need to choose larger primes P and Q. The product of P-1 and Q-1 needs to be at least an 80-bit number");
        if(mpz_gcd_ui(NULL, phi, e) == 1) break;
        --e;
        if(e < 3) croak("The chosen primes are unsuitable in prbg_ms() function");
        }

     mpz_clear(phi);

     kdoub = (double) 2 / (double) e;
     kdoub = (double) 1 - kdoub;
     kdoub *= (double) bign;
     k = kdoub;
     r = bign - k;

     gmp_randinit_default(state);
     gmp_randseed(state, *seed);
     mpz_urandomb(*seed, state, r);
     gmp_randclear(state);

     r_shift = bits_required % k;

     if(r_shift) its = (bits_required / k) + 1;
     else its = bits_required / k;

     mpz_init(mod);
     mpz_init(keep);
     mpz_set_ui(*outref, 0);
     mpz_ui_pow_ui(mod, 2, k);

     for(i = 0; i < its; ++i) {
         mpz_powm_ui(*seed, *seed, e, n);
         mpz_mod(keep, *seed, mod);
         mpz_mul_2exp(*outref, *outref, k);
         mpz_add(*outref, *outref, keep);
         mpz_fdiv_q_2exp(*seed, *seed, k);
         if(!i) check = k - mpz_sizeinbase(keep, 2);    
         }
     mpz_clear(n); 
     mpz_clear(keep);
     mpz_clear(mod);

     if(r_shift) mpz_fdiv_q_2exp(*outref, *outref, k - r_shift);

     if(check + mpz_sizeinbase(*outref, 2) != bits_required)
        croak("Bug in csprng() function");

}

void Rprbg_bbs(mpz_t * outref, mpz_t * p, mpz_t * q, mpz_t * seed, int bits_required) {
     mpz_t n, gcd, one;
     unsigned long i, k;
     gmp_randstate_t state;

     if(mpz_fdiv_ui(*p, 4) != 3) croak ("First prime is unsuitable for Blum-Blum-Shub prbg (must be congruent to 3, mod 4)");
     if(mpz_fdiv_ui(*q, 4) != 3) croak ("Second prime is unsuitable for Blum-Blum-Shub prbg (must be congruent to 3, mod 4)"); 
     mpz_init(n);

     mpz_mul(n, *p, *q);

     mpz_init(gcd);
     gmp_randinit_default(state);
     gmp_randseed(state, *seed);
     mpz_urandomm(*seed, state, n);
     gmp_randclear(state);

     while(1) {
           if(mpz_cmp_ui(*seed, 100) < 0)croak("Blum-Blum-Shub seed is ridiculously small. How did this happen ?");
           mpz_gcd(gcd, *seed, n);
           if(!mpz_cmp_ui(gcd, 1)) break;
           mpz_sub_ui(*seed, *seed, 1);
           }

     mpz_powm_ui(*seed, *seed, 2, n);

     mpz_init_set_ui(*outref, 0);
     mpz_init_set_ui(one, 1);

     for(i = 0; i < bits_required; ++i) {
         mpz_powm_ui(*seed, *seed, 2, n);
         k = mpz_tstbit(*seed, 0);
         if(k) {
            mpz_mul_2exp(gcd, one, i);      
            mpz_add(*outref, gcd, *outref);
            }
         }

     mpz_clear(n); 
     mpz_clear(gcd);
     mpz_clear(one);

}

int Rmonobit(mpz_t * bitstream) {
    unsigned long len, i, count = 0;

    len = mpz_sizeinbase(*bitstream, 2);

    if(len > 20000) croak("Wrong size random sequence for monobit test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in Rmonobit test\n");
       return 0;
       }

    count = mpz_popcount(*bitstream);

    if(count > 9654 && count < 10346) return 1;
    return 0;

}

int Rlong_run(mpz_t * bitstream) {
    unsigned long i, el, init = 0, count = 0, len, t;

    len = mpz_sizeinbase(*bitstream, 2);

    if(len > 20000) croak("Wrong size random sequence for Rlong_run test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in long_run test\n");
       return 0;
       }

    el = mpz_tstbit(*bitstream, 0);

    for(i = 0; i < len; ++i) {
        t = mpz_tstbit(*bitstream, i);
        if(t == el) ++count;
        else {
           el = t;
           if(count > init) init = count;
           count = 1;
           }
        }

    if(init < 34 && count < 34) return 1;
    return 0;

}

int Rruns(mpz_t * bitstream) {
    int b[6] = {0,0,0,0,0,0}, g[6] = {0,0,0,0,0,0},
    len, count = 1, i, t, diff;

    len = mpz_sizeinbase(*bitstream, 2);
    diff = 20000 - len;

    if(len > 20000) croak("Wrong size random sequence for monobit test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in runs test\n");
       return 0;
       }

    --len;

    for(i = 0; i < len; ++i) {
        t = mpz_tstbit(*bitstream, i);
        if(t == mpz_tstbit(*bitstream, i + 1)) ++ count;
        else {
           if(t) {
              if(count >= 6) ++b[5];
              else ++b[count - 1];
              }
            else {
              if(count >= 6) ++g[5];
              else ++g[count - 1];
              }
            count = 1;
            }
         }

     if(count >= 6) {
        if(mpz_tstbit(*bitstream, len)) {
           ++b[5];
           if(diff) ++g[diff - 1];
           }
        else ++g[5];
        }
     else {
        if(mpz_tstbit(*bitstream, len)) {
           ++b[count - 1];
           if(diff) ++g[diff - 1];
           }
        else {
          count += diff;
          if(count >= 6) ++g[5];
          else ++g[count - 1];
          }
        }

             
        if (
            b[0] <= 2267 || g[0] <= 2267 ||
            b[0] >= 2733 || g[0] >= 2733 ||
            b[1] <= 1079 || g[1] <= 1079 ||
            b[1] >= 1421 || g[1] >= 1421 ||
            b[2] <= 502  || g[2] <= 502  ||
            b[2] >= 748  || g[2] >= 748  ||
            b[3] <= 223  || g[3] <= 223  ||
            b[3] >= 402  || g[3] >= 402  ||
            b[4] <= 90   || g[4] <= 90   ||
            b[4] >= 223  || g[4] >= 223  ||
            b[5] <= 90   || g[5] <= 90   ||
            b[5] >= 223  || g[5] >= 223
           ) return 0;

    return 1;

}

int Rpoker (mpz_t * bitstream) {
    int counts[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
       len, i, st, diff;
    double n = 0;

    len = mpz_sizeinbase(*bitstream, 2);

    if(len > 20000) croak("Wrong size random sequence for poker test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in poker test\n");
       return 0;
       }

/* pad with trailing zeroes (if necessary) to achieve length of 20000 bits. */
    diff = 20000 - len;
    if(diff) mpz_mul_2exp(*bitstream, *bitstream, diff);
    if(mpz_sizeinbase(*bitstream, 2) != 20000) croak("Bug in bit sequence manipulation in poker() function");

    for(i = 0; i < 20000; i += 4) {
        st = mpz_tstbit(*bitstream, i) +
             (mpz_tstbit(*bitstream, i + 1) * 2) +
             (mpz_tstbit(*bitstream, i + 2) * 4) +
             (mpz_tstbit(*bitstream, i + 3) * 8);
        ++counts[st];
        } 


    for(i = 0; i < 16; ++i) n += counts[i] * counts[i];

    n /= 5000;
    n *= 16;
    n -= 5000;

    if(n > 1.03 && n < 57.4) return 1;
    
    return 0;        
}

int Rparity_ul(unsigned long v) {
    v = (v >> 16) ^ v;
    v = (v >> 8) ^ v;
    v = (v >> 4) ^ v;
    v = (v >> 2) ^ v;

    return ((v >> 1) ^ v) & 1;
}

int Rparity_gmp(mpz_t * num) {

    if(mpz_popcount(*num) & 1) return 1;
    return 0;
}

SV * Rrotate_left_ul(SV * ulnum, SV * ulb, SV * uls) {
     int i, r = 0, a;
     unsigned long num = SvUV(ulnum), b = SvUV(ulb), s = SvUV(uls);
     b -= 1;

     if(s > b) croak ("rotate_left_ul() undefined for given arguments");
     for(i = 0; i < s; ++i) {
         if(num & (1 << (b - i))) {
            r += 1 << (s - 1 - i);
            }
         }

     num <<= s;
     num += r;

     a = 1 << (b + 1);
     a -= 1;
     num &= a;
     return newSVuv(num);
}

void Rrotate_left_gmp(mpz_t * out, mpz_t * num, SV * bsv, SV * ssv) {
     mpz_t r;
     int i;
     unsigned long s = SvUV(ssv), b = SvUV(bsv);

     if(s >= b) croak ("rotate_left_gmp() undefined for given arguments");

     mpz_init2(r, s);

     mpz_set(*out, *num);

     for(i = b - s; i < b; ++i) {
         if(mpz_tstbit(*out, i)) {
            mpz_setbit(r, i - (b - s));
            mpz_clrbit(*out, i);
            }
         } 

     mpz_mul_2exp(*out, *out, s);
     mpz_add(*out, *out, r);
     mpz_clear(r);
}  

SV * Rrotate_right_ul(SV * ulnum, SV * ulb, SV * uls) {
     int i, r = 0, a, t;
     unsigned long num = SvUV(ulnum), b = SvUV(ulb), s = SvUV(uls);

     if(s >= b) croak ("rotate_right_ul() undefined for given arguments");

     a = 1 << b;
     a -= 1;
     num &= a;

     for(i = 0; i < s; ++i) {
         t = 1 << i;
         if(num & t) {
            r += t;
            }
         }

     num >>= s;
     num += r << (b - s);

     return newSVuv(num);
}

void Rrotate_right_gmp(mpz_t * out, mpz_t * num, SV * ulb, SV * uls) {
     mpz_t r;
     int i;
     unsigned long b = SvUV(ulb), s = SvUV(uls);

     if(s >= b) croak ("rotate_right_gmp() undefined for given arguments");

     mpz_init2(r, b);
     mpz_set(*out, *num); 

     for(i = 0; i < s; ++i) {
         if(mpz_tstbit(*out, i)) mpz_setbit(r, b - s + i);
         }

     mpz_div_2exp(*out, *out, s);
     mpz_add(*out, *out, r);
     mpz_clear(r);
}

void Rrsa_cert(mpz_t * n, mpz_t * d, mpz_t * e, mpz_t * p, mpz_t * q) {
     mpz_t pless1, qless1;

     mpz_init(pless1);
     mpz_init(qless1);

     mpz_mul(*n, *p, *q);
     if(!mpz_tstbit(*e, 0))
        mpz_add_ui(*e, *e, 1);

     mpz_sub_ui(pless1, *p, 1);
     mpz_sub_ui(qless1, *q, 1);
     mpz_mul(pless1, pless1, qless1);

     while(1) {
           mpz_gcd(qless1, pless1, *e);
           if(!mpz_cmp_ui(qless1, 1)) break;
           mpz_add_ui(*e, *e, 2);           
           }

     mpz_gcdext(qless1, *d, NULL, *e, pless1);
     if(mpz_cmp_ui(*d, 0) < 0)
        mpz_add(*d, *d, pless1);

/* Sanity Check */
     mpz_mul(qless1, *d, *e);
     mpz_mod(qless1, qless1, pless1);
     if(mpz_cmp_ui(*d, 0) <= 0 ||
        mpz_cmp(*d, pless1) >= 0 ||
        mpz_cmp_ui(qless1, 1)) croak ("Error in RSA certificate calculation");
         

mpz_clear(pless1);
mpz_clear(qless1);
}

void Rmers_div_q(mpz_t * q, mpz_t * n, mpz_t * d) {
     mpz_t n_copy, add;
     unsigned long s = mpz_sizeinbase(*d, 2);

     mpz_init_set(n_copy, *n);
     mpz_init2(add, mpz_sizeinbase(*d, 2));

     mpz_set_ui(*q, 0);

     while(mpz_cmp(n_copy, *d) > 0) {
           mpz_and(add, n_copy, *d);
           mpz_tdiv_q_2exp(n_copy, n_copy, s);
           mpz_add(*q, *q, n_copy);
           mpz_add(n_copy, n_copy, add);
           }

     if(!mpz_cmp(n_copy, *d))
        mpz_add_ui(*q, *q, 1);

     mpz_clear(n_copy);
     mpz_clear(add);     
  
}

void Rmers_div_r(mpz_t * r, mpz_t * n, mpz_t * d) {
     mpz_t n_copy, add;
     unsigned long s = mpz_sizeinbase(*d, 2);

     mpz_init_set(n_copy, *n);
     mpz_init2(add, mpz_sizeinbase(*d, 2));

     mpz_set_ui(*r, 0);

     while(mpz_cmp(n_copy, *d) > 0) {
           mpz_and(add, n_copy, *d);
           mpz_tdiv_q_2exp(n_copy, n_copy, s);
           mpz_add(*r, *r, add);
           }

     mpz_add(*r, *r, n_copy);
     mpz_tdiv_r(*r, *r, *d);

     mpz_clear(n_copy);
     mpz_clear(add);     
  
}

void Rmers_div_r5(mpz_t * r, mpz_t * n, mpz_t * d, mpz_t * n_copy, mpz_t * add) {
     unsigned long s = mpz_sizeinbase(*d, 2);

     mpz_set(*n_copy, *n);
     mpz_set_ui(*r, 0);

     while(mpz_cmp(*n_copy, *d) > 0) {
           mpz_and(*add, *n_copy, *d);
           mpz_tdiv_q_2exp(*n_copy, *n_copy, s);
           mpz_add(*r, *r, *add);
           }

     mpz_add(*r, *r, *n_copy);
     mpz_tdiv_r(*r, *r, *d);

}

void Rmers_div_qr(mpz_t * q, mpz_t * r, mpz_t * n, mpz_t * d) {
     mpz_t n_copy, n2_copy, add;
     unsigned long s = mpz_sizeinbase(*d, 2);

     mpz_init_set(n_copy, *n);
     mpz_init_set(n2_copy, *n);
     mpz_init2(add, mpz_sizeinbase(*d, 2));

     mpz_set_ui(*q, 0);
     mpz_set_ui(*r, 0);

     while(mpz_cmp(n_copy, *d) > 0) {
           mpz_and(add, n_copy, *d);
           mpz_tdiv_q_2exp(n_copy, n_copy, s);
           mpz_add(*q, *q, n_copy);
           mpz_add(n_copy, n_copy, add);
           }

     if(!mpz_cmp(n_copy, *d))
        mpz_add_ui(*q, *q, 1);

     while(mpz_cmp(n2_copy, *d) > 0) {
           mpz_and(add, n2_copy, *d);
           mpz_tdiv_q_2exp(n2_copy, n2_copy, s);
           mpz_add(*r, *r, add);
           }

     mpz_add(*r, *r, n2_copy);
     mpz_tdiv_r(*r, *r, *d);

     mpz_clear(n_copy);
     mpz_clear(n2_copy);
     mpz_clear(add);     
  
}

SV * _Rmpz_out_str(mpz_t * p, SV * base) {
     unsigned long ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("2nd argument supplied to Rmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     ret = mpz_out_str(NULL, SvUV(base), *p);
     fflush(stdout);
     return newSVuv(ret);
}

SV * _Rmpz_out_strS(mpz_t * p, SV * base, SV * suff) {
     unsigned long ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("2nd argument supplied to Rmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     ret = mpz_out_str(NULL, SvUV(base), *p);
     printf("%s", SvPV_nolen(suff));
     fflush(stdout);
     return newSVuv(ret);
}

SV * _Rmpz_out_strP(SV * pre, mpz_t * p, SV * base) {
     unsigned long ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("3rd argument supplied to Rmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     printf("%s", SvPV_nolen(pre));
     ret = mpz_out_str(NULL, SvUV(base), *p);
     fflush(stdout);
     return newSVuv(ret);
}

SV * _Rmpz_out_strPS(SV * pre, mpz_t * p, SV * base, SV * suff) {
     unsigned long ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("3rd argument supplied to Rmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     printf("%s", SvPV_nolen(pre));
     ret = mpz_out_str(NULL, SvUV(base), *p);
     printf("%s", SvPV_nolen(suff));
     fflush(stdout);
     return newSVuv(ret);
}

SV * _TRmpz_out_str(FILE * stream, SV * base, mpz_t * p) {
     size_t ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("2nd argument supplied to TRmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     ret = mpz_out_str(stream, (int)SvIV(base), *p);
     fflush(stream);
     return newSVuv(ret);
}

SV * _TRmpz_out_strS(FILE * stream, SV * base, mpz_t * p, SV * suff) {
     size_t ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("2nd argument supplied to TRmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     ret = mpz_out_str(stream, (int)SvIV(base), *p);
     fflush(stream);
     fprintf(stream, "%s", SvPV_nolen(suff));
     fflush(stream);
     return newSVuv(ret);
}

SV * _TRmpz_out_strP(SV * pre, FILE * stream, SV * base, mpz_t * p) {
     size_t ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("3rd argument supplied to TRmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     fprintf(stream, "%s", SvPV_nolen(pre));
     fflush(stream);
     ret = mpz_out_str(stream, (int)SvIV(base), *p);
     fflush(stream);
     return newSVuv(ret);
}

SV * _TRmpz_out_strPS(SV * pre, FILE * stream, SV * base, mpz_t * p, SV * suff) {
     size_t ret;
     if((SvIV(base) > -2 && SvIV(base) < 2) || SvIV(base) < -36 || SvIV(base) > 62)
       croak("3rd argument supplied to TRmpz_out_str is out of allowable range (must be in range -36..-2, 2..62)");
     fprintf(stream, "%s", SvPV_nolen(pre));
     fflush(stream);
     ret = mpz_out_str(stream, (int)SvIV(base), *p);
     fflush(stream);
     fprintf(stream, "%s", SvPV_nolen(suff));
     fflush(stream);
     return newSVuv(ret);
}

SV * Rmpz_inp_str(mpz_t * p, SV * base) {
     size_t ret;
     if(SvUV(base) == 1 || SvUV(base) > 62)
       croak("2nd argument supplied to Rmpz_inp_str is out of allowable range (must be in range 0, 2..62)");
     ret = mpz_inp_str(*p, NULL, SvUV(base));
     /* fflush(stdin); */
     return newSVuv(ret);
}

SV * TRmpz_inp_str(mpz_t * p, FILE * stream, SV * base) {
     size_t ret;
     if(SvUV(base) == 1 || SvUV(base) > 62)
       croak("4th argument supplied to TRmpz_inp_str is out of allowable range (must be in range 0, 2..62)");
     ret = mpz_inp_str(*p, stream, (int)SvIV(base));
     /* fflush(stream); */
     return newSVuv(ret);
}

void eratosthenes(SV * x_arg) {
dXSARGS;

unsigned short *v, set[16] = {65534,65533,65531,65527,65519,65503,65471,65407,65279,65023,64511,63487,61439,57343,49151,32767};
unsigned long leap, i, size, b, imax, k, x = SvUV(x_arg);

if(x & 1) croak("max_num argument must be even in eratosthenes function");

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 16)) size = b / 16;
else size = (b / 16) + 1;

Newz(2, v, size, unsigned short);
if(v == NULL) croak("2: Unable to allocate memory in eratosthenes function");

for(i = 1; i < size; ++i) v[i] = 65535;
v[0] = 65534;

for(i = 0; i <= imax; ++i) {
    
    if(v[i / 16] & (1 << (i % 16))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             v[k / 16] &= set[k % 16];
             k += leap;
             }
       }
}

size = 1;
sp = mark;
XPUSHs(sv_2mortal(newSVuv(2)));

for(i = 0; i < b; ++i) {
    if(v[i / 16] & (1 << (i % 16))) {
      XPUSHs(sv_2mortal(newSVuv(2 * i + 1)));
      ++size;
      }
   }

Safefree(v);

PUTBACK;
XSRETURN(size);

}


int trial_div_ul(mpz_t * num, SV * x_arg) {

unsigned short *v, set[16] = {65534,65533,65531,65527,65519,65503,65471,65407,65279,65023,64511,63487,61439,57343,49151,32767};
unsigned long leap, i, size, b, imax, k, x = SvUV(x_arg);

if(x & 1) croak("Second argument supplied to trial_div_ul() must be even");

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 16)) size = b / 16;
else size = (b / 16) + 1;

Newz(2, v, size, unsigned short);
if(v == NULL) croak("2: Unable to allocate memory in trial_div_ul() function");

for(i = 1; i < size; ++i) v[i] = 65535;
v[0] = 65534;

for(i = 0; i <= imax; ++i) {
    
    if(v[i / 16] & (1 << (i % 16))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             v[k / 16] &= set[k % 16];
             k += leap;
             }
       }
}

if(mpz_divisible_ui_p(*num, 2)) {
   Safefree(v);
   return 2;
   }

for(i = 0; i < b; ++i) {
    if(v[i / 16] & (1 << (i % 16))) {
      if(mpz_divisible_ui_p(*num, 2 * i + 1)) {
         Safefree(v);
         return (2 * i + 1);
         }
      }
   }

Safefree(v);

return 1;

}

void Rflipbit(mpz_t * flipped, mpz_t * orig) {
     int i, len;

     mpz_set_ui(*flipped, 0);
     len = mpz_sizeinbase(*orig, 2);

     for(i = 0; i < len; ++i) {
        if(!mpz_tstbit(*orig, i)) mpz_setbit(*flipped, i);
        }
     }

// Next 2 functions became available with GMP-4.2

void Rmpz_rootrem(mpz_t * root, mpz_t * rem, mpz_t * u, SV * d) { 
     mpz_rootrem(*root, *rem, *u, (unsigned long)SvUV(d));
}

void Rmpz_combit(mpz_t * num, SV * bitpos) {
     mpz_combit(*num, (unsigned long)SvUV(bitpos));
}

/* Finish typemapping - typemap 1st arg only */

SV * overload_mul(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_mul function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_mul");
       mpz_mul(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#else

     if(SvUOK(b)) {
       mpz_mul_ui(*mpz_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_mul_si(*mpz_t_obj, *a, SvIV(b));
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#else
       mpz_set_d(*mpz_t_obj, SvNV(b));
#endif
       mpz_mul(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_mul");
       mpz_mul(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mul(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_mul");
}

SV * overload_add(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_add function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_add");
       mpz_add(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_add_ui(*mpz_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_add_ui(*mpz_t_obj, *a, SvIV(b));
         return obj_ref;
         }
       mpz_sub_ui(*mpz_t_obj, *a, SvIV(b) * -1);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#else
       mpz_set_d(*mpz_t_obj, SvNV(b));
#endif
       mpz_add(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_add");
       mpz_add(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_add(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_add function");

}

SV * overload_sub(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_sub function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_sub");
       if(third == &PL_sv_yes) mpz_sub(*mpz_t_obj, *mpz_t_obj, *a);
       else mpz_sub(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) {
         mpz_ui_sub(*mpz_t_obj, SvUV(b), *a);
         return obj_ref;
         }
       mpz_sub_ui(*mpz_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) {
           mpz_ui_sub(*mpz_t_obj, SvIV(b), *a);
           return obj_ref;
           }
         mpz_sub_ui(*mpz_t_obj, *a, SvIV(b));
         return obj_ref;
         }
       mpz_add_ui(*mpz_t_obj, *a, SvIV(b) * -1);
       if(third == &PL_sv_yes) mpz_neg(*mpz_t_obj, *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#else
       mpz_set_d(*mpz_t_obj, SvNV(b));
#endif
       if(third == &PL_sv_yes) mpz_sub(*mpz_t_obj, *mpz_t_obj, *a);
       else mpz_sub(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_sub");
       if(third == &PL_sv_yes) mpz_sub(*mpz_t_obj, *mpz_t_obj, *a);
       else mpz_sub(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_sub(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_sub function");

}

SV * overload_div(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_div function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);



#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_div");
       if(third == &PL_sv_yes) mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *a);
       else mpz_tdiv_q(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) {
         mpz_set_ui(*mpz_t_obj, SvUV(b));
         mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *a);
         return obj_ref;
         }
       mpz_tdiv_q_ui(*mpz_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) {
           mpz_set_si(*mpz_t_obj, SvIV(b));
           mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *a);
           return obj_ref;
           }
         mpz_tdiv_q_ui(*mpz_t_obj, *a, SvIV(b));
         return obj_ref;
         }
       if(third == &PL_sv_yes) {
         mpz_set_si(*mpz_t_obj, SvIV(b));
         mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *a);
         return obj_ref;
         }
       mpz_tdiv_q_ui(*mpz_t_obj, *a, SvIV(b) * -1);
       mpz_neg(*mpz_t_obj, *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#else
       mpz_set_d(*mpz_t_obj, SvNV(b));
#endif
       if(third == &PL_sv_yes) mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *a);
       else mpz_tdiv_q(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_div");
       if(third == &PL_sv_yes) mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *a);
       else mpz_tdiv_q(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_tdiv_q(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_div function");

}

SV * overload_mod (mpz_t * a, SV * b, SV * third) {
     mpz_t *mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_mod function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_mod");
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *a);  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *a, *mpz_t_obj);  
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) {
         mpz_set_ui(*mpz_t_obj, SvUV(b));
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *a);  
         return obj_ref;       
         }
       mpz_mod_ui(*mpz_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *a);  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *a, *mpz_t_obj);  
       return obj_ref;
       } 
#endif  

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#else
       mpz_set_d(*mpz_t_obj, SvNV(b));
#endif
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *a);  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *a, *mpz_t_obj);  
       return obj_ref;   
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_mod");
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *a);  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *a, *mpz_t_obj);  
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mod(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_mod function");
}

SV * overload_string(mpz_t * p, SV * second, SV * third) {
     char * out;
     SV * outsv;

     New(2, out, mpz_sizeinbase(*p, 10) + 3, char);
     if(out == NULL) croak("Failed to allocate memory in overload_string function");

     mpz_get_str(out, 10, *p);
     outsv = newSVpv(out, 0);
     Safefree(out);
     return outsv;
}

SV * overload_copy(mpz_t * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_copy function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");

     mpz_init_set(*mpz_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_abs(mpz_t * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_abs function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     mpz_abs(*mpz_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_lshift(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_lshift function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     if(SvUOK(b)) {
       mpz_mul_2exp(*mpz_t_obj, *a, SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_lshift");
       mpz_mul_2exp(*mpz_t_obj, *a, SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     croak("Invalid argument supplied to Math::GMPz::overload_lshift");
}

SV * overload_rshift(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_rshift function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     if(SvUOK(b)) {
       mpz_tdiv_q_2exp(*mpz_t_obj, *a, SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_rshift");
       mpz_tdiv_q_2exp(*mpz_t_obj, *a, SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     croak("Invalid argument supplied to Math::GMPz::overload_rshift");
}

SV * overload_pow(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     if(third == &PL_sv_yes) croak("Invalid argument supplied to Math::GMPz::overload_pow function");

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_pow function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

     if(SvUOK(b)) {
       mpz_pow_ui(*mpz_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_pow");
       mpz_pow_ui(*mpz_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     croak("Invalid argument supplied to Math::GMPz::overload_pow");
}

SV * overload_sqrt(mpz_t * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_sqrt function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     if(mpz_cmp_ui(*p, 0) < 0) croak("Negative value supplied as argument to overload_sqrt");
     mpz_sqrt(*mpz_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_and(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_and function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_and");
       mpz_and(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_set_ui(*mpz_t_obj, SvUV(b));
       mpz_and(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       mpz_and(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#endif


     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#endif

       mpz_set_d(*mpz_t_obj, SvNV(b));
       mpz_and(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_and");
       mpz_and(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_and(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_and");
}

SV * overload_ior(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_ior function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_ior");
       mpz_ior(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_set_ui(*mpz_t_obj, SvUV(b));
       mpz_ior(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       mpz_ior(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#else
       mpz_set_d(*mpz_t_obj, SvNV(b));
#endif
       mpz_ior(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_ior");
       mpz_ior(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_ior(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_ior");
}

SV * overload_xor(mpz_t * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_xor function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_xor");
       mpz_xor(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_set_ui(*mpz_t_obj, SvUV(b));
       mpz_xor(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       mpz_xor(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_set_str(*mpz_t_obj, buffer, 10);
#else
       mpz_set_d(*mpz_t_obj, SvNV(b));
#endif
       mpz_xor(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_xor");
       mpz_xor(*mpz_t_obj, *a, *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_xor(*mpz_t_obj, *a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_xor");
}

SV * overload_com(mpz_t * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_com function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     mpz_com(*mpz_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_gt(mpz_t * a, SV * b, SV * third) {
     int ret;
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gt");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
     if(SvIOK(b)) {
       ret = mpz_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
       ret = mpz_cmp(*a, t);
       mpz_clear(t); 
#else
       ret = mpz_cmp_d(*a, SvNV(b));
#endif
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gt");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret > 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_gt");
}

SV * overload_gte(mpz_t * a, SV * b, SV * third) {
     int ret;
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gte");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
       ret = mpz_cmp(*a, t);
       mpz_clear(t); 
#else
       ret = mpz_cmp_d(*a, SvNV(b));
#endif
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gte");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret >= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_gte");
}

SV * overload_lt(mpz_t * a, SV * b, SV * third) {
     int ret;
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lt");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
       ret = mpz_cmp(*a, t);
       mpz_clear(t); 
#else
       ret = mpz_cmp_d(*a, SvNV(b));
#endif
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lt");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret < 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_lt");
}

SV * overload_lte(mpz_t * a, SV * b, SV * third) {
     int ret;
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lte");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
       ret = mpz_cmp(*a, t);
       mpz_clear(t); 
#else
       ret = mpz_cmp_d(*a, SvNV(b));
#endif
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lte");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret <= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_lte");
}

SV * overload_spaceship(mpz_t * a, SV * b, SV * third) {
     int ret;
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_spaceship");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
       ret = mpz_cmp(*a, t);
       mpz_clear(t); 
#else
       ret = mpz_cmp_d(*a, SvNV(b));
#endif
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_spaceship");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_spaceship");
}

SV * overload_equiv(mpz_t * a, SV * b, SV * third) {
     int ret;
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_equiv");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*a, SvUV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*a, SvIV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
       ret = mpz_cmp(*a, t);
       mpz_clear(t); 
#else
       ret = mpz_cmp_d(*a, SvNV(b));
#endif
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_equiv");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret == 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_equiv");
}

SV * overload_not_equiv(mpz_t * a, SV * b, SV * third) {
     int ret;
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_not_equiv");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
       ret = mpz_cmp(*a, t);
       mpz_clear(t); 
#else
       ret = mpz_cmp_d(*a, SvNV(b));
#endif
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_not_equiv");
       ret = mpz_cmp(*a, t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*a, *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret != 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_not_equiv");
}

SV * overload_not(mpz_t * a, SV * second, SV * third) {
     if(mpz_cmp_ui(*a, 0)) return newSViv(0);
     return newSViv(1);
}

/* Finish typemapping */

SV * overload_xor_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_xor_eq");
         }
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_init_set_ui(t, SvUV(b));
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvIOK(b)) {
       mpz_init_set_si(t, SvIV(b));
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_xor_eq");
         }
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }


     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_xor_eq");
}

SV * overload_ior_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_ior_eq");
         }
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_init_set_ui(t, SvUV(b));
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvIOK(b)) {
       mpz_init_set_si(t, SvIV(b));
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_ior_eq");
         }
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_ior_eq");
}

SV * overload_and_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_and_eq");
         }
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_init_set_ui(t, SvUV(b));
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvIOK(b)) {
       mpz_init_set_si(t, SvIV(b));
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_and_eq");
         }
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_and_eq");
}

SV * overload_pow_eq(SV * a, SV * b, SV * third) {
     SvREFCNT_inc(a);

     if(SvUOK(b)) {
       mpz_pow_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_pow_eq");
       mpz_pow_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_pow_eq");
}

SV * overload_rshift_eq(SV * a, SV * b, SV * third) {

     SvREFCNT_inc(a);

     if(SvUOK(b)) {
       mpz_tdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_rshift_eq");
       mpz_tdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       return a;
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_rshift_eq");
}

SV * overload_lshift_eq(SV * a, SV * b, SV * third) {

     SvREFCNT_inc(a);

     if(SvUOK(b)) {
       mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_lshift_eq");
       mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       return a;
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_lshift_eq");
}

SV * overload_inc(SV * p, SV * second, SV * third) {
     SvREFCNT_inc(p);
     mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 1);
     return p;
}

SV * overload_dec(SV * p, SV * second, SV * third) {
     SvREFCNT_inc(p);
     mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 1);
     return p;
}

SV * overload_mod_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_mod_eq");
         }
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_mod_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) > 0) {
         mpz_mod_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
         return a;
         }
       mpz_init_set_si(t, SvNV(b));
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_mod_eq");
         }
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_mod_eq");
}

SV * get_refcnt(SV * s) {
     return newSVuv(SvREFCNT(s));
}

SV * overload_div_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_div_eq");
         }
       mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_tdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_tdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return a;
         }
       mpz_tdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       mpz_neg(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_div_eq");
         }
       mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_div_eq function");

}

SV * overload_sub_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_sub_eq");
         }
       mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return a;
         }
       mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_sub_eq");
         }
       mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_sub_eq function");

}

SV * overload_add_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_add_eq");
         }
       mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return a;
         }
       mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_add_eq");
         }
       mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }


     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_add_eq function");

}

SV * overload_mul_eq(SV * a, SV * b, SV * third) {
     mpz_t t;
#ifdef USE_LONG_DOUBLE
     char buffer[50];
#endif

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);      
         croak(" Invalid string supplied to Math::GMPz::overload_mul_eq");
         }
       mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_mul_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       mpz_mul_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       long double ld = (long double)SvNV(b) >= 0 ? floorl((long double)SvNV(b)) : ceill((long double)SvNV(b));
       sprintf(buffer, "%.0Lf", ld);
       mpz_init_set_str(t, buffer, 10);
#else
       mpz_init_set_d(t, SvNV(b));
#endif
       mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);      
         croak(" Invalid string supplied to Math::GMPz::overload_mul_eq");
         }
       mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_mul_eq");
}

SV * eratosthenes_string(SV * x_arg) {

unsigned char *v, set[8] = {254,253,251,247,239,223,191,127};
unsigned long leap, i, size, b, imax, k, x = (unsigned long)SvUV(x_arg);
SV * ret;

if(x & 1) croak("max_num argument must be even in eratosthenes_string()");

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 8)) size = b / 8;
else size = (b / 8) + 1;

ret = NEWSV(0, size);

for(i = 1; i < size; ++i) SvPVX(ret)[i] = 255;
SvPVX(ret)[0] = 254;

for(i = 0; i <= imax; ++i) {
    
    if(SvPVX(ret)[i / 8] & (1 << (i % 8))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             SvPVX(ret)[k / 8] &= set[k % 8];
             k += leap;
             }
       }
}

SvPOK_on(ret);
SvCUR_set(ret, size);
*SvEND(ret) = 0;

return ret;

}

SV * gmp_v() {
     return newSVpv(gmp_version, 0);
}

SV * wrap_gmp_printf(SV * a, SV * b) {
     int ret;
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz")) {
         ret = gmp_printf(SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         fflush(stdout);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq")) {
         ret = gmp_printf(SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         fflush(stdout);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf")) {
         ret = gmp_printf(SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         fflush(stdout);
         return newSViv(ret);
       }
   
       croak("Unrecognised object supplied as argument to Rmpz_printf");
     } 

     if(SvUOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvUV(b));
       fflush(stdout);
       return newSViv(ret);
     }
     if(SvIOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvIV(b));
       fflush(stdout);
       return newSViv(ret);
     }
     if(SvNOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvNV(b));
       fflush(stdout);
       return newSViv(ret);
     }
     if(SvPOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvPV_nolen(b));
       fflush(stdout);
       return newSViv(ret);
     }
  
     croak("Unrecognised type supplied as argument to Rmpz_printf");
}

SV * wrap_gmp_fprintf(FILE * stream, SV * a, SV * b) {
     int ret;
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz")) {
         ret = gmp_fprintf(stream, SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         fflush(stream);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq")) {
         ret = gmp_fprintf(stream, SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         fflush(stream);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf")) {
         ret = gmp_fprintf(stream, SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         fflush(stream);
         return newSViv(ret);
       }
 
       else croak("Unrecognised object supplied as argument to Rmpz_fprintf");
     } 

     if(SvUOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvUV(b));
       fflush(stream);
       return newSViv(ret);
     }
     if(SvIOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvIV(b));
       fflush(stream);
       return newSViv(ret);
     }
     if(SvNOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvNV(b));
       fflush(stream);
       return newSViv(ret);
     }
     if(SvPOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvPV_nolen(b));
       fflush(stream);
       return newSViv(ret);
     }

     croak("Unrecognised type supplied as argument to Rmpz_fprintf");
}

SV * wrap_gmp_sprintf(char * stream, SV * a, SV * b) {
     int ret;
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz")) {
         ret = gmp_sprintf(stream, SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq")) {
         ret = gmp_sprintf(stream, SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf")) {
         ret = gmp_sprintf(stream, SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       croak("Unrecognised object supplied as argument to Rmpz_sprintf");
     } 

     if(SvUOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvUV(b));
       return newSViv(ret);
     }

     if(SvIOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvIV(b));
       return newSViv(ret);
     }

     if(SvNOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvNV(b));
       return newSViv(ret);
     }

     if(SvPOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvPV_nolen(b));
       return newSViv(ret);
     }

     croak("Unrecognised type supplied as argument to Rmpz_sprintf");
}

SV * _itsa(SV * a) {
     if(SvUOK(a)) return newSVuv(1);
     if(SvIOK(a)) return newSVuv(2);
     if(SvNOK(a)) return newSVuv(3);
     if(SvPOK(a)) return newSVuv(4);
     if(sv_isobject(a)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(a))), "Math::GMPz")) return newSVuv(8);
       if(strEQ(HvNAME(SvSTASH(SvRV(a))), "Math::GMP")) return newSVuv(9);
     }
     return newSVuv(0);
}

void Rmpz_urandomb(SV * p, ...) {
     dXSARGS;
     unsigned long q, i, thingies;

     thingies = items;
     q = SvUV(ST(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpz_urandomb function");

     for(i = 0; i < q; ++i) {
        mpz_urandomb(*(INT2PTR(mpz_t *, SvIV(SvRV(ST(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(ST(thingies - 3))))), SvUV(ST(thingies - 2)));
        }

     XSRETURN(0);
}

void Rmpz_urandomm(SV * x, ...){
     dXSARGS;
     unsigned long q, i, thingies;

     thingies = items;
     q = SvUV(ST(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpz_urandomm function"); 

     for(i = 0; i < q; ++i) {
        mpz_urandomm(*(INT2PTR(mpz_t *, SvIV(SvRV(ST(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(ST(thingies - 3))))), *(INT2PTR(mpz_t *, SvIV(SvRV(ST(thingies - 2))))));
        }
     
     XSRETURN(0);
}

void Rmpz_rrandomb(SV * x, ...) {
     dXSARGS;
     unsigned long q, i, thingies;

     thingies = items;
     q = SvUV(ST(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpz_rrandomb function"); 

     for(i = 0; i < q; ++i) {
        mpz_rrandomb(*(INT2PTR(mpz_t *, SvIV(SvRV(ST(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(ST(thingies - 3))))), SvUV(ST(thingies - 2)));
        }

     XSRETURN(0);
}

SV * rand_init(SV * seed) {
     gmp_randstate_t * state;
     SV * obj_ref, * obj;

     New(1, state, 1, gmp_randstate_t);
     if(state == NULL) croak("Failed to allocate memory in rand_init function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     gmp_randinit_default(*state);
     gmp_randseed(*state, *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))));
     sv_setiv(obj, INT2PTR(IV, state));
     SvREADONLY_on(obj);
     return obj_ref;
     }

void rand_clear(SV * p) {
     gmp_randclear(*(INT2PTR(gmp_randstate_t *, SvIV(SvRV(p)))));
     Safefree(INT2PTR(gmp_randstate_t *, SvIV(SvRV(p))));
     }

int _has_longlong() {
#ifdef USE_64_BIT_INT
    return 1;
#else
    return 0;
#endif
}

int _has_longdouble() {
#ifdef USE_LONG_DOUBLE
    return 1;
#else
    return 0;
#endif
}

/* Has inttypes.h been included ? */
int _has_inttypes() {
#ifdef _MSC_VER
return 0;
#else
#if defined USE_64_BIT_INT || defined USE_LONG_DOUBLE
return 1;
#else
return 0;
#endif
#endif
}

SV * Rmpz_inp_raw(mpz_t * a, FILE * stream) {
     size_t ret = mpz_inp_raw(*a, stream);
     fflush(stream);
     return newSVuv(ret);
}

SV * Rmpz_out_raw(FILE * stream, mpz_t * a) {
     size_t ret = mpz_out_raw(stream, *a);
     fflush(stream);
     return newSVuv(ret);
}

SV * ___GNU_MP_VERSION() {
     return newSVuv(__GNU_MP_VERSION);
}

SV * ___GNU_MP_VERSION_MINOR() {
     return newSVuv(__GNU_MP_VERSION_MINOR);
}

SV * ___GNU_MP_VERSION_PATCHLEVEL() {
     return newSVuv(__GNU_MP_VERSION_PATCHLEVEL);
}

SV * ___GMP_CC() {
     char * ret = __GMP_CC;
     return newSVpv(ret, 0);
}

SV * ___GMP_CFLAGS() {
     char * ret = __GMP_CFLAGS;
     return newSVpv(ret, 0);
}

MODULE = Math::GMPz	PACKAGE = Math::GMPz	

PROTOTYPES: DISABLE


SV *
Rmpz_init_set_str_nobless (num, base)
	SV *	num
	SV *	base

SV *
Rmpz_init2_nobless (bits)
	SV *	bits

SV *
Rmpz_init_nobless ()

SV *
Rmpz_init_set_nobless (p)
	mpz_t *	p

SV *
Rmpz_init_set_ui_nobless (p)
	SV *	p

SV *
Rmpz_init_set_si_nobless (p)
	SV *	p

SV *
Rmpz_init_set_d_nobless (p)
	SV *	p

SV *
Rmpz_init ()

SV *
Rmpz_init_set (p)
	mpz_t *	p

SV *
Rmpz_init_set_ui (p)
	SV *	p

SV *
Rmpz_init_set_si (p)
	SV *	p

SV *
Rmpz_init_set_d (p)
	SV *	p

SV *
_Rmpz_init_set_ld (p)
	SV *	p

SV *
Rmpz_init_set_str (num, base)
	SV *	num
	SV *	base

SV *
Rmpz_init2 (bits)
	SV *	bits

SV *
Rmpz_get_str (p, base)
	mpz_t *	p
	SV *	base

void
DESTROY (p)
	mpz_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	DESTROY(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clear (p)
	mpz_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clear(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clear_mpz (p)
	mpz_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clear_mpz(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clear_ptr (p)
	mpz_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clear_ptr(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_realloc2 (integer, bits)
	mpz_t *	integer
	SV *	bits
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_realloc2(integer, bits);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set (copy, original)
	mpz_t *	copy
	mpz_t *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_q (copy, original)
	mpz_t *	copy
	mpq_t *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_q(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_f (copy, original)
	mpz_t *	copy
	mpf_t *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_f(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_si (copy, original)
	mpz_t *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_si(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_ui (copy, original)
	mpz_t *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_ui(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_d (copy, original)
	mpz_t *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_d(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_str (copy, original, base)
	mpz_t *	copy
	SV *	original
	SV *	base
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_str(copy, original, base);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_swap (a, b)
	mpz_t *	a
	mpz_t *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_swap(a, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_get_ui (n)
	mpz_t *	n

SV *
Rmpz_get_si (n)
	mpz_t *	n

SV *
Rmpz_get_d (n)
	mpz_t *	n

void
Rmpz_get_d_2exp (n)
	mpz_t *	n
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_get_d_2exp(n);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_getlimbn (p, n)
	mpz_t *	p
	SV *	n

void
Rmpz_add (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_add(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_add_ui (dest, src, num)
	mpz_t *	dest
	mpz_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_add_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_sub (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sub(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_sub_ui (dest, src, num)
	mpz_t *	dest
	mpz_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sub_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_ui_sub (dest, num, src)
	mpz_t *	dest
	SV *	num
	mpz_t *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_ui_sub(dest, num, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul_si (dest, src, num)
	mpz_t *	dest
	mpz_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul_si(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul_ui (dest, src, num)
	mpz_t *	dest
	mpz_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_addmul (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_addmul(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_addmul_ui (dest, src, num)
	mpz_t *	dest
	mpz_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_addmul_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_submul (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_submul(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_submul_ui (dest, src, num)
	mpz_t *	dest
	mpz_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_submul_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul_2exp (dest, src1, b)
	mpz_t *	dest
	mpz_t *	src1
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul_2exp(dest, src1, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_neg (dest, src)
	mpz_t *	dest
	mpz_t *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_neg(dest, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_abs (dest, src)
	mpz_t *	dest
	mpz_t *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_abs(dest, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_q (q, n, d)
	mpz_t *	q
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_r (mod, n, d)
	mpz_t *	mod
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_r(mod, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_qr (q, r, n, d)
	mpz_t *	q
	mpz_t *	r
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_cdiv_q_ui (q, n, d)
	mpz_t *	q
	mpz_t *	n
	SV *	d

SV *
Rmpz_cdiv_r_ui (q, n, d)
	mpz_t *	q
	mpz_t *	n
	SV *	d

SV *
Rmpz_cdiv_qr_ui (q, r, n, d)
	mpz_t *	q
	mpz_t *	r
	mpz_t *	n
	SV *	d

int
Rmpz_cdiv_ui (n, d)
	mpz_t *	n
	SV *	d

void
Rmpz_cdiv_q_2exp (q, n, b)
	mpz_t *	q
	mpz_t *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_q_2exp(q, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_r_2exp (r, n, b)
	mpz_t *	r
	mpz_t *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_r_2exp(r, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_q (q, n, d)
	mpz_t *	q
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_r (mod, n, d)
	mpz_t *	mod
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_r(mod, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_qr (q, r, n, d)
	mpz_t *	q
	mpz_t *	r
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_fdiv_q_ui (q, n, d)
	mpz_t *	q
	mpz_t *	n
	SV *	d

SV *
Rmpz_fdiv_r_ui (q, n, d)
	mpz_t *	q
	mpz_t *	n
	SV *	d

SV *
Rmpz_fdiv_qr_ui (q, r, n, d)
	mpz_t *	q
	mpz_t *	r
	mpz_t *	n
	SV *	d

int
Rmpz_fdiv_ui (n, d)
	mpz_t *	n
	SV *	d

void
Rmpz_fdiv_q_2exp (q, n, b)
	mpz_t *	q
	mpz_t *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_q_2exp(q, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_r_2exp (r, n, b)
	mpz_t *	r
	mpz_t *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_r_2exp(r, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_q (q, n, d)
	mpz_t *	q
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_r (mod, n, d)
	mpz_t *	mod
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_r(mod, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_qr (q, r, n, d)
	mpz_t *	q
	mpz_t *	r
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_tdiv_q_ui (q, n, d)
	mpz_t *	q
	mpz_t *	n
	SV *	d

SV *
Rmpz_tdiv_r_ui (q, n, d)
	mpz_t *	q
	mpz_t *	n
	SV *	d

SV *
Rmpz_tdiv_qr_ui (q, r, n, d)
	mpz_t *	q
	mpz_t *	r
	mpz_t *	n
	SV *	d

int
Rmpz_tdiv_ui (n, d)
	mpz_t *	n
	SV *	d

void
Rmpz_tdiv_q_2exp (q, n, b)
	mpz_t *	q
	mpz_t *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_q_2exp(q, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_r_2exp (r, n, b)
	mpz_t *	r
	mpz_t *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_r_2exp(r, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mod (r, n, d)
	mpz_t *	r
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mod(r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_mod_ui (r, n, d)
	mpz_t *	r
	mpz_t *	n
	SV *	d

void
Rmpz_divexact (dest, n, d)
	mpz_t *	dest
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_divexact(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_divexact_ui (dest, n, d)
	mpz_t *	dest
	mpz_t *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_divexact_ui(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_divisible_p (n, d)
	mpz_t *	n
	mpz_t *	d

int
Rmpz_divisible_ui_p (n, d)
	mpz_t *	n
	SV *	d

int
Rmpz_divisible_2exp_p (n, b)
	mpz_t *	n
	SV *	b

SV *
Rmpz_congruent_p (n, c, d)
	mpz_t *	n
	mpz_t *	c
	mpz_t *	d

SV *
Rmpz_congruent_ui_p (n, c, d)
	mpz_t *	n
	SV *	c
	SV *	d

SV *
Rmpz_congruent_2exp_p (n, c, d)
	mpz_t *	n
	mpz_t *	c
	SV *	d

void
Rmpz_powm (dest, base, exp, mod)
	mpz_t *	dest
	mpz_t *	base
	mpz_t *	exp
	mpz_t *	mod
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_powm(dest, base, exp, mod);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_powm_ui (dest, base, exp, mod)
	mpz_t *	dest
	mpz_t *	base
	SV *	exp
	mpz_t *	mod
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_powm_ui(dest, base, exp, mod);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_pow_ui (dest, base, exp)
	mpz_t *	dest
	mpz_t *	base
	SV *	exp
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_pow_ui(dest, base, exp);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_ui_pow_ui (dest, base, exp)
	mpz_t *	dest
	SV *	base
	SV *	exp
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_ui_pow_ui(dest, base, exp);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_root (r, n, d)
	mpz_t *	r
	mpz_t *	n
	SV *	d

void
Rmpz_sqrt (r, n)
	mpz_t *	r
	mpz_t *	n
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sqrt(r, n);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_sqrtrem (root, rem, src)
	mpz_t *	root
	mpz_t *	rem
	mpz_t *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sqrtrem(root, rem, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_perfect_power_p (in)
	mpz_t *	in

int
Rmpz_perfect_square_p (in)
	mpz_t *	in

int
Rmpz_probab_prime_p (cand, reps)
	mpz_t *	cand
	SV *	reps

void
Rmpz_nextprime (prime, init)
	mpz_t *	prime
	mpz_t *	init
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_nextprime(prime, init);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_gcd (gcd, src1, src2)
	mpz_t *	gcd
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_gcd(gcd, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_gcd_ui (gcd, n, d)
	mpz_t *	gcd
	mpz_t *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_gcd_ui(gcd, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_gcdext (g, s, t, a, b)
	mpz_t *	g
	mpz_t *	s
	mpz_t *	t
	mpz_t *	a
	mpz_t *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_gcdext(g, s, t, a, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lcm (lcm, src1, src2)
	mpz_t *	lcm
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lcm(lcm, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lcm_ui (lcm, src1, src2)
	mpz_t *	lcm
	mpz_t *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lcm_ui(lcm, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_invert (inv, src1, src2)
	mpz_t *	inv
	mpz_t *	src1
	mpz_t *	src2

int
Rmpz_jacobi (a, b)
	mpz_t *	a
	mpz_t *	b

int
Rmpz_legendre (a, b)
	mpz_t *	a
	mpz_t *	b

int
Rmpz_kronecker (a, b)
	mpz_t *	a
	mpz_t *	b

int
Rmpz_kronecker_si (a, b)
	mpz_t *	a
	SV *	b

int
Rmpz_kronecker_ui (a, b)
	mpz_t *	a
	SV *	b

int
Rmpz_si_kronecker (a, b)
	SV *	a
	mpz_t *	b

int
Rmpz_ui_kronecker (a, b)
	SV *	a
	mpz_t *	b

SV *
Rmpz_remove (rem, src1, src2)
	mpz_t *	rem
	mpz_t *	src1
	mpz_t *	src2

void
Rmpz_fac_ui (fac, b)
	mpz_t *	fac
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fac_ui(fac, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_bin_ui (dest, n, d)
	mpz_t *	dest
	mpz_t *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_bin_ui(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_bin_uiui (dest, n, d)
	mpz_t *	dest
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_bin_uiui(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fib_ui (dest, b)
	mpz_t *	dest
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fib_ui(dest, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fib2_ui (fn, fnsub1, b)
	mpz_t *	fn
	mpz_t *	fnsub1
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fib2_ui(fn, fnsub1, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lucnum_ui (dest, b)
	mpz_t *	dest
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lucnum_ui(dest, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lucnum2_ui (ln, lnsub1, b)
	mpz_t *	ln
	mpz_t *	lnsub1
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lucnum2_ui(ln, lnsub1, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_cmp (n, d)
	mpz_t *	n
	mpz_t *	d

int
Rmpz_cmp_d (n, d)
	mpz_t *	n
	SV *	d

int
Rmpz_cmp_si (n, d)
	mpz_t *	n
	SV *	d

int
Rmpz_cmp_ui (n, d)
	mpz_t *	n
	SV *	d

int
Rmpz_cmpabs (n, d)
	mpz_t *	n
	mpz_t *	d

int
Rmpz_cmpabs_d (n, d)
	mpz_t *	n
	SV *	d

int
Rmpz_cmpabs_ui (n, d)
	mpz_t *	n
	SV *	d

int
Rmpz_sgn (n)
	mpz_t *	n

void
Rmpz_and (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_and(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_ior (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_ior(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_xor (dest, src1, src2)
	mpz_t *	dest
	mpz_t *	src1
	mpz_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_xor(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_com (dest, src)
	mpz_t *	dest
	mpz_t *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_com(dest, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_popcount (in)
	mpz_t *	in

int
Rmpz_hamdist (dest, src)
	mpz_t *	dest
	mpz_t *	src

SV *
Rmpz_scan0 (n, start_bit)
	mpz_t *	n
	SV *	start_bit

SV *
Rmpz_scan1 (n, start_bit)
	mpz_t *	n
	SV *	start_bit

void
Rmpz_setbit (num, bit_index)
	mpz_t *	num
	SV *	bit_index
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_setbit(num, bit_index);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clrbit (num, bit_index)
	mpz_t *	num
	SV *	bit_index
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clrbit(num, bit_index);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_tstbit (num, bit_index)
	mpz_t *	num
	SV *	bit_index

void
Rmpz_import (rop, count, order, size, endian, nails, op)
	mpz_t *	rop
	SV *	count
	SV *	order
	SV *	size
	SV *	endian
	SV *	nails
	SV *	op
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_import(rop, count, order, size, endian, nails, op);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_export (order, size, endian, nails, number)
	SV *	order
	SV *	size
	SV *	endian
	SV *	nails
	mpz_t *	number

int
Rmpz_fits_ulong_p (in)
	mpz_t *	in

int
Rmpz_fits_slong_p (in)
	mpz_t *	in

int
Rmpz_fits_uint_p (in)
	mpz_t *	in

int
Rmpz_fits_sint_p (in)
	mpz_t *	in

int
Rmpz_fits_ushort_p (in)
	mpz_t *	in

int
Rmpz_fits_sshort_p (in)
	mpz_t *	in

int
Rmpz_odd_p (in)
	mpz_t *	in

int
Rmpz_even_p (in)
	mpz_t *	in

SV *
Rmpz_size (in)
	mpz_t *	in

SV *
Rmpz_sizeinbase (in, base)
	mpz_t *	in
	SV *	base

void
Rsieve_gmp (x_arg, a, number)
	int	x_arg
	int	a
	mpz_t *	number
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rsieve_gmp(x_arg, a, number);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rfermat_gmp (num, base)
	mpz_t *	num
	SV *	base

int
Rrm_gmp (num, base)
	mpz_t *	num
	SV *	base

void
Rprbg_ms (outref, p, q, seed, bits_required)
	mpz_t *	outref
	mpz_t *	p
	mpz_t *	q
	mpz_t *	seed
	int	bits_required
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rprbg_ms(outref, p, q, seed, bits_required);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rprbg_bbs (outref, p, q, seed, bits_required)
	mpz_t *	outref
	mpz_t *	p
	mpz_t *	q
	mpz_t *	seed
	int	bits_required
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rprbg_bbs(outref, p, q, seed, bits_required);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmonobit (bitstream)
	mpz_t *	bitstream

int
Rlong_run (bitstream)
	mpz_t *	bitstream

int
Rruns (bitstream)
	mpz_t *	bitstream

int
Rpoker (bitstream)
	mpz_t *	bitstream

int
Rparity_ul (v)
	unsigned long	v

int
Rparity_gmp (num)
	mpz_t *	num

SV *
Rrotate_left_ul (ulnum, ulb, uls)
	SV *	ulnum
	SV *	ulb
	SV *	uls

void
Rrotate_left_gmp (out, num, bsv, ssv)
	mpz_t *	out
	mpz_t *	num
	SV *	bsv
	SV *	ssv
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rrotate_left_gmp(out, num, bsv, ssv);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rrotate_right_ul (ulnum, ulb, uls)
	SV *	ulnum
	SV *	ulb
	SV *	uls

void
Rrotate_right_gmp (out, num, ulb, uls)
	mpz_t *	out
	mpz_t *	num
	SV *	ulb
	SV *	uls
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rrotate_right_gmp(out, num, ulb, uls);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rrsa_cert (n, d, e, p, q)
	mpz_t *	n
	mpz_t *	d
	mpz_t *	e
	mpz_t *	p
	mpz_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rrsa_cert(n, d, e, p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_q (q, n, d)
	mpz_t *	q
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_r (r, n, d)
	mpz_t *	r
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_r(r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_r5 (r, n, d, n_copy, add)
	mpz_t *	r
	mpz_t *	n
	mpz_t *	d
	mpz_t *	n_copy
	mpz_t *	add
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_r5(r, n, d, n_copy, add);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_qr (q, r, n, d)
	mpz_t *	q
	mpz_t *	r
	mpz_t *	n
	mpz_t *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
_Rmpz_out_str (p, base)
	mpz_t *	p
	SV *	base

SV *
_Rmpz_out_strS (p, base, suff)
	mpz_t *	p
	SV *	base
	SV *	suff

SV *
_Rmpz_out_strP (pre, p, base)
	SV *	pre
	mpz_t *	p
	SV *	base

SV *
_Rmpz_out_strPS (pre, p, base, suff)
	SV *	pre
	mpz_t *	p
	SV *	base
	SV *	suff

SV *
_TRmpz_out_str (stream, base, p)
	FILE *	stream
	SV *	base
	mpz_t *	p

SV *
_TRmpz_out_strS (stream, base, p, suff)
	FILE *	stream
	SV *	base
	mpz_t *	p
	SV *	suff

SV *
_TRmpz_out_strP (pre, stream, base, p)
	SV *	pre
	FILE *	stream
	SV *	base
	mpz_t *	p

SV *
_TRmpz_out_strPS (pre, stream, base, p, suff)
	SV *	pre
	FILE *	stream
	SV *	base
	mpz_t *	p
	SV *	suff

SV *
Rmpz_inp_str (p, base)
	mpz_t *	p
	SV *	base

SV *
TRmpz_inp_str (p, stream, base)
	mpz_t *	p
	FILE *	stream
	SV *	base

void
eratosthenes (x_arg)
	SV *	x_arg
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	eratosthenes(x_arg);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
trial_div_ul (num, x_arg)
	mpz_t *	num
	SV *	x_arg

void
Rflipbit (flipped, orig)
	mpz_t *	flipped
	mpz_t *	orig
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rflipbit(flipped, orig);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_rootrem (root, rem, u, d)
	mpz_t *	root
	mpz_t *	rem
	mpz_t *	u
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_rootrem(root, rem, u, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_combit (num, bitpos)
	mpz_t *	num
	SV *	bitpos
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_combit(num, bitpos);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
overload_mul (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_add (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_sub (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_div (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_mod (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_string (p, second, third)
	mpz_t *	p
	SV *	second
	SV *	third

SV *
overload_copy (p, second, third)
	mpz_t *	p
	SV *	second
	SV *	third

SV *
overload_abs (p, second, third)
	mpz_t *	p
	SV *	second
	SV *	third

SV *
overload_lshift (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_rshift (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_pow (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_sqrt (p, second, third)
	mpz_t *	p
	SV *	second
	SV *	third

SV *
overload_and (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_ior (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_xor (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_com (p, second, third)
	mpz_t *	p
	SV *	second
	SV *	third

SV *
overload_gt (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_gte (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_lt (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_lte (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_spaceship (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_equiv (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_not_equiv (a, b, third)
	mpz_t *	a
	SV *	b
	SV *	third

SV *
overload_not (a, second, third)
	mpz_t *	a
	SV *	second
	SV *	third

SV *
overload_xor_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_ior_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_and_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_pow_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_rshift_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_lshift_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_inc (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_dec (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_mod_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
get_refcnt (s)
	SV *	s

SV *
overload_div_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sub_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_add_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_mul_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
eratosthenes_string (x_arg)
	SV *	x_arg

SV *
gmp_v ()

SV *
wrap_gmp_printf (a, b)
	SV *	a
	SV *	b

SV *
wrap_gmp_fprintf (stream, a, b)
	FILE *	stream
	SV *	a
	SV *	b

SV *
wrap_gmp_sprintf (stream, a, b)
	char *	stream
	SV *	a
	SV *	b

SV *
_itsa (a)
	SV *	a

void
Rmpz_urandomb (p, ...)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_urandomb(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_urandomm (x, ...)
	SV *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_urandomm(x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_rrandomb (x, ...)
	SV *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_rrandomb(x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
rand_init (seed)
	SV *	seed

void
rand_clear (p)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	rand_clear(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
_has_longlong ()

int
_has_longdouble ()

int
_has_inttypes ()

SV *
Rmpz_inp_raw (a, stream)
	mpz_t *	a
	FILE *	stream

SV *
Rmpz_out_raw (stream, a)
	FILE *	stream
	mpz_t *	a

SV *
___GNU_MP_VERSION ()

SV *
___GNU_MP_VERSION_MINOR ()

SV *
___GNU_MP_VERSION_PATCHLEVEL ()

SV *
___GMP_CC ()

SV *
___GMP_CFLAGS ()

