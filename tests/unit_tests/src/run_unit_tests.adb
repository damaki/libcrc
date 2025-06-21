--
--  Copyright 2025 (C) Daniel King
--
--  SPDX-License-Identifier: Apache-2.0
--
with AUnit.Reporter.Text;
with AUnit.Run;

with Test_Suites;

procedure Run_Unit_Tests is
   procedure Runner is new AUnit.Run.Test_Runner (Test_Suites.Suite);

   Reporter : AUnit.Reporter.Text.Text_Reporter;

begin
   Runner (Reporter);
end Run_Unit_Tests;
