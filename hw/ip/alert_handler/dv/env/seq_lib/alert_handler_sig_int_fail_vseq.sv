// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// this sequence enable signal intergrity fail. TODO: current escalation int fail

class alert_handler_sig_int_fail_vseq extends alert_handler_sanity_vseq;
  `uvm_object_utils(alert_handler_sig_int_fail_vseq)

  `uvm_object_new

  constraint sig_int_c {
    alert_int_err == '1;
  }

  constraint enable_alert_int_fail_only_c {
    local_alert_en inside {1 << LocalAlertIntFail, 1 << LocalEscIntFail};
    // TODO: temp constraint, take off once scb support ping response fail
  }

  function void pre_randomize();
    this.enable_one_alert_c.constraint_mode(0);
    // TODO: add support this.enable_classa_only_c.constraint_mode(0);
  endfunction

endclass : alert_handler_sig_int_fail_vseq
