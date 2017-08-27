Loop, 10
{
  if(A_index == 1)
  {
    straight = 1
  }
  else
  {
    straight = %straight%`r`n%A_index%
  }
}
clipboard := straight