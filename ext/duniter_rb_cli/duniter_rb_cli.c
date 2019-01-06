#include "duniter_rb_cli.h"

VALUE rb_mDuniterRbCli;

void
Init_duniter_rb_cli(void)
{
  rb_mDuniterRbCli = rb_define_module("DuniterRbCli");
}
