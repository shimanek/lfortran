module nullify_05_type
contains
   subroutine OBJ()
   end subroutine
end module

module nullify_05_mod
   use nullify_05_type
   procedure(OBJ), pointer :: calfun_ext
end module

program nullify_05
   use nullify_05_mod
   use nullify_05_type
   procedure(OBJ), pointer :: calfun
   calfun => OBJ
   nullify(calfun)
   calfun_ext => OBJ
   nullify(calfun_ext)

   if (associated(calfun)) error stop
   if (associated(calfun_ext)) error stop
end program
