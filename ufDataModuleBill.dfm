object DM_Bill: TDM_Bill
  OldCreateOrder = False
  Left = 1059
  Top = 201
  Height = 607
  Width = 470
  object Uni_cmp_main: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  scott.rep_bills_compound.main(p_sel_obj => :p_sel_obj,'
      '                          p_reu => :p_reu,'
      '                          p_kul => :p_kul,'
      '                          p_nd => :p_nd,'
      '                          p_kw => :p_kw,'
      '                          p_lsk => :p_lsk,'
      '                          p_lsk1 => :p_lsk1,'
      '                          p_firstnum => :p_firstnum,'
      '                          p_lastnum => :p_lastnum,'
      '                          p_is_closed => :p_is_closed,'
      '                          p_mg => :p_mg,'
      '                          p_for_arch => :p_for_arch,'
      '                          p_sel_uk => :p_sel_uk,'
      '                          p_rfcur => :p_rfcur);'
      'end;')
    Constraints = <>
    Left = 32
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_sel_obj'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_reu'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_kul'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_nd'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_kw'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_lsk'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_lsk1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_firstnum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_lastnum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_for_arch'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_detail_primary: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.detail(p_klsk => :p_klsk,'
      '                            p_is_closed => :p_is_closed,'
      '                            p_mg => :p_mg,'
      '                            p_sel_tp => :p_sel_tp,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                            p_rfcur => :p_rfcur);'
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 32
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_tp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_detail_main: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.detail(p_klsk => :p_klsk,'
      '                            p_is_closed => :p_is_closed,'
      '                            p_mg => :p_mg,'
      '                            p_sel_tp => :p_sel_tp,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                            p_rfcur => :p_rfcur);'
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 184
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_tp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_detail_cap: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.detail(p_klsk => :p_klsk,'
      '                            p_is_closed => :p_is_closed,'
      '                            p_mg => :p_mg,'
      '                            p_sel_tp => :p_sel_tp,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                            p_rfcur => :p_rfcur);'
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 32
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_tp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_funds_primary: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.funds_flow_by_klsk(p_klsk => :p_klsk,'
      '                                        p_sel_tp => :p_sel_tp,'
      '                            p_is_closed => :p_is_closed,'
      '                                        p_mg => :p_mg,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                                        p_rfcur => :p_rfcur);'
      ''
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 32
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_tp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_funds_cap: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.funds_flow_by_klsk(p_klsk => :p_klsk,'
      '                                        p_sel_tp => :p_sel_tp,'
      '                            p_is_closed => :p_is_closed,'
      '                                        p_mg => :p_mg,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                                        p_rfcur => :p_rfcur);'
      ''
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 32
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_tp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_contractors: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.contractors(p_klsk => :p_klsk,'
      '                            p_is_closed => :p_is_closed,'
      '                            p_mg => :p_mg,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                            p_rfcur => :p_rfcur);'
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 32
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_qr: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.getQr(p_klsk => :p_klsk,'
      '                            p_is_closed => :p_is_closed,'
      '                            p_mg => :p_mg,'
      '                            p_sel_tp => :p_sel_tp,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                            p_rfcur => :p_rfcur);'
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 32
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_tp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_funds_main: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      ''
      ' scott.rep_bills_compound.funds_flow_by_klsk(p_klsk => :p_klsk,'
      '                                        p_sel_tp => :p_sel_tp,'
      '                            p_is_closed => :p_is_closed,'
      '                                        p_mg => :p_mg,'
      '                            p_sel_flt_tp => :p_sel_flt_tp,'
      '                          p_sel_uk => :p_sel_uk,'
      '                                        p_rfcur => :p_rfcur);'
      ''
      'end;')
    MasterSource = DS_cmp_main
    MasterFields = 'k_lsk_id'
    DetailFields = 'p_klsk'
    Constraints = <>
    Left = 184
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_klsk'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_tp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_closed'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_sel_flt_tp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_sel_uk'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object Uni_cmp_funds_lsk: TUniQuery
    Connection = DataModule1.UniConnection1
    SQL.Strings = (
      'begin'
      '  scott.rep_bills_ext.detail(p_lsk => :p_lsk,'
      '                       p_mg => :p_mg,'
      '                       p_includesaldo => :p_includesaldo,'
      '                       p_rfcur => :p_rfcur);'
      'end;')
    MasterSource = DS_cmp_funds_primary
    MasterFields = 'lsk'
    DetailFields = 'p_lsk'
    Constraints = <>
    Left = 184
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'p_lsk'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_mg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_includesaldo'
        ParamType = ptInput
      end
      item
        DataType = ftCursor
        Name = 'p_rfcur'
        Value = 'Object'
      end>
  end
  object DS_cmp_main: TDataSource
    DataSet = Uni_cmp_main
    Left = 112
    Top = 80
  end
  object DS_cmp_funds_primary: TDataSource
    DataSet = Uni_cmp_funds_primary
    Left = 112
    Top = 211
  end
end
