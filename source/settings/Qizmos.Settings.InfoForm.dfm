object wSettingsInfoForm: TwSettingsInfoForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Info'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    640
    480)
  TextHeight = 15
  object imLogo: TVirtualImage
    Left = 8
    Top = 17
    Width = 96
    Height = 96
    ImageCollection = dmCommon.icLogo
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = 0
    ImageName = 'Logo'
  end
  object txHeaderText: TLabel
    Left = 118
    Top = 42
    Width = 150
    Height = 59
    Caption = 'Qizmos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txCopyright: TLabel
    Left = 294
    Top = 61
    Width = 176
    Height = 15
    Caption = 'Copyright '#169' 2023 Reiner L'#228'mmle'
  end
  object txVersion: TLabel
    Left = 294
    Top = 42
    Width = 56
    Height = 15
    Caption = 'Version 1.0'
  end
  object txLicenses: TLabel
    Left = 12
    Top = 135
    Width = 116
    Height = 15
    Caption = 'Drittanbieter-Lizenzen'
  end
  object txWebsite: TLinkLabel
    Left = 294
    Top = 80
    Width = 93
    Height = 19
    Caption = 
      '<a href="http://www.quarkz.de">Website</a> | <a href="https://gi' +
      'thub.com/quarkz-de/Qizmos">GitHub</a>'
    TabOrder = 0
    OnLinkClick = txWebsiteLinkClick
  end
  object edLicenses: TMemo
    Left = 12
    Top = 156
    Width = 620
    Height = 313
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      '# Icons8'
      ''
      'Icons permitted by Icons8: https://icons8.com'
      ''
      ''
      '# DDetours'
      ''
      ''
      'Mozilla Public License Version 2.0'
      '=================================='
      ''
      '1. Definitions'
      '--------------'
      ''
      '1.1. "Contributor"'
      
        '    means each individual or legal entity that creates, contribu' +
        'tes to'
      '    the creation of, or owns Covered Software.'
      ''
      '1.2. "Contributor Version"'
      
        '    means the combination of the Contributions of others (if any' +
        ') used'
      
        '    by a Contributor and that particular Contributor'#39's Contribut' +
        'ion.'
      ''
      '1.3. "Contribution"'
      '    means Covered Software of a particular Contributor.'
      ''
      '1.4. "Covered Software"'
      
        '    means Source Code Form to which the initial Contributor has ' +
        'attached'
      
        '    the notice in Exhibit A, the Executable Form of such Source ' +
        'Code'
      
        '    Form, and Modifications of such Source Code Form, in each ca' +
        'se'
      '    including portions thereof.'
      ''
      '1.5. "Incompatible With Secondary Licenses"'
      '    means'
      ''
      
        '    (a) that the initial Contributor has attached the notice des' +
        'cribed'
      '        in Exhibit B to the Covered Software; or'
      ''
      
        '    (b) that the Covered Software was made available under the t' +
        'erms of'
      
        '        version 1.1 or earlier of the License, but not also unde' +
        'r the'
      '        terms of a Secondary License.'
      ''
      '1.6. "Executable Form"'
      '    means any form of the work other than Source Code Form.'
      ''
      '1.7. "Larger Work"'
      
        '    means a work that combines Covered Software with other mater' +
        'ial, in'
      '    a separate file or files, that is not Covered Software.'
      ''
      '1.8. "License"'
      '    means this document.'
      ''
      '1.9. "Licensable"'
      
        '    means having the right to grant, to the maximum extent possi' +
        'ble,'
      
        '    whether at the time of the initial grant or subsequently, an' +
        'y and'
      '    all of the rights conveyed by this License.'
      ''
      '1.10. "Modifications"'
      '    means any of the following:'
      ''
      
        '    (a) any file in Source Code Form that results from an additi' +
        'on to,'
      
        '        deletion from, or modification of the contents of Covere' +
        'd'
      '        Software; or'
      ''
      
        '    (b) any new file in Source Code Form that contains any Cover' +
        'ed'
      '        Software.'
      ''
      '1.11. "Patent Claims" of a Contributor'
      
        '    means any patent claim(s), including without limitation, met' +
        'hod,'
      
        '    process, and apparatus claims, in any patent Licensable by s' +
        'uch'
      
        '    Contributor that would be infringed, but for the grant of th' +
        'e'
      
        '    License, by the making, using, selling, offering for sale, h' +
        'aving'
      '    made, import, or transfer of either its Contributions or its'
      '    Contributor Version.'
      ''
      '1.12. "Secondary License"'
      
        '    means either the GNU General Public License, Version 2.0, th' +
        'e GNU'
      
        '    Lesser General Public License, Version 2.1, the GNU Affero G' +
        'eneral'
      '    Public License, Version 3.0, or any later versions of those'
      '    licenses.'
      ''
      '1.13. "Source Code Form"'
      
        '    means the form of the work preferred for making modification' +
        's.'
      ''
      '1.14. "You" (or "Your")'
      
        '    means an individual or a legal entity exercising rights unde' +
        'r this'
      '    License. For legal entities, "You" includes any entity that'
      
        '    controls, is controlled by, or is under common control with ' +
        'You. For'
      
        '    purposes of this definition, "control" means (a) the power, ' +
        'direct'
      
        '    or indirect, to cause the direction or management of such en' +
        'tity,'
      
        '    whether by contract or otherwise, or (b) ownership of more t' +
        'han'
      '    fifty percent (50%) of the outstanding shares or beneficial'
      '    ownership of such entity.'
      ''
      '2. License Grants and Conditions'
      '--------------------------------'
      ''
      '2.1. Grants'
      ''
      'Each Contributor hereby grants You a world-wide, royalty-free,'
      'non-exclusive license:'
      ''
      
        '(a) under intellectual property rights (other than patent or tra' +
        'demark)'
      
        '    Licensable by such Contributor to use, reproduce, make avail' +
        'able,'
      
        '    modify, display, perform, distribute, and otherwise exploit ' +
        'its'
      
        '    Contributions, either on an unmodified basis, with Modificat' +
        'ions, or'
      '    as part of a Larger Work; and'
      ''
      
        '(b) under Patent Claims of such Contributor to make, use, sell, ' +
        'offer'
      
        '    for sale, have made, import, and otherwise transfer either i' +
        'ts'
      '    Contributions or its Contributor Version.'
      ''
      '2.2. Effective Date'
      ''
      
        'The licenses granted in Section 2.1 with respect to any Contribu' +
        'tion'
      
        'become effective for each Contribution on the date the Contribut' +
        'or first'
      'distributes such Contribution.'
      ''
      '2.3. Limitations on Grant Scope'
      ''
      
        'The licenses granted in this Section 2 are the only rights grant' +
        'ed under'
      
        'this License. No additional rights or licenses will be implied f' +
        'rom the'
      
        'distribution or licensing of Covered Software under this License' +
        '.'
      
        'Notwithstanding Section 2.1(b) above, no patent license is grant' +
        'ed by a'
      'Contributor:'
      ''
      
        '(a) for any code that a Contributor has removed from Covered Sof' +
        'tware;'
      '    or'
      ''
      
        '(b) for infringements caused by: (i) Your and any other third pa' +
        'rty'#39's'
      
        '    modifications of Covered Software, or (ii) the combination o' +
        'f its'
      
        '    Contributions with other software (except as part of its Con' +
        'tributor'
      '    Version); or'
      ''
      
        '(c) under Patent Claims infringed by Covered Software in the abs' +
        'ence of'
      '    its Contributions.'
      ''
      
        'This License does not grant any rights in the trademarks, servic' +
        'e marks,'
      
        'or logos of any Contributor (except as may be necessary to compl' +
        'y with'
      'the notice requirements in Section 3.4).'
      ''
      '2.4. Subsequent Licenses'
      ''
      
        'No Contributor makes additional grants as a result of Your choic' +
        'e to'
      
        'distribute the Covered Software under a subsequent version of th' +
        'is'
      
        'License (see Section 10.2) or under the terms of a Secondary Lic' +
        'ense (if'
      'permitted under the terms of Section 3.3).'
      ''
      '2.5. Representation'
      ''
      'Each Contributor represents that the Contributor believes its'
      
        'Contributions are its original creation(s) or it has sufficient ' +
        'rights'
      
        'to grant the rights to its Contributions conveyed by this Licens' +
        'e.'
      ''
      '2.6. Fair Use'
      ''
      'This License is not intended to limit any rights You have under'
      
        'applicable copyright doctrines of fair use, fair dealing, or oth' +
        'er'
      'equivalents.'
      ''
      '2.7. Conditions'
      ''
      
        'Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses g' +
        'ranted'
      'in Section 2.1.'
      ''
      '3. Responsibilities'
      '-------------------'
      ''
      '3.1. Distribution of Source Form'
      ''
      
        'All distribution of Covered Software in Source Code Form, includ' +
        'ing any'
      
        'Modifications that You create or to which You contribute, must b' +
        'e under'
      
        'the terms of this License. You must inform recipients that the S' +
        'ource'
      
        'Code Form of the Covered Software is governed by the terms of th' +
        'is'
      
        'License, and how they can obtain a copy of this License. You may' +
        ' not'
      
        'attempt to alter or restrict the recipients'#39' rights in the Sourc' +
        'e Code'
      'Form.'
      ''
      '3.2. Distribution of Executable Form'
      ''
      'If You distribute Covered Software in Executable Form then:'
      ''
      
        '(a) such Covered Software must also be made available in Source ' +
        'Code'
      
        '    Form, as described in Section 3.1, and You must inform recip' +
        'ients of'
      
        '    the Executable Form how they can obtain a copy of such Sourc' +
        'e Code'
      
        '    Form by reasonable means in a timely manner, at a charge no ' +
        'more'
      '    than the cost of distribution to the recipient; and'
      ''
      
        '(b) You may distribute such Executable Form under the terms of t' +
        'his'
      
        '    License, or sublicense it under different terms, provided th' +
        'at the'
      
        '    license for the Executable Form does not attempt to limit or' +
        ' alter'
      
        '    the recipients'#39' rights in the Source Code Form under this Li' +
        'cense.'
      ''
      '3.3. Distribution of a Larger Work'
      ''
      
        'You may create and distribute a Larger Work under terms of Your ' +
        'choice,'
      
        'provided that You also comply with the requirements of this Lice' +
        'nse for'
      
        'the Covered Software. If the Larger Work is a combination of Cov' +
        'ered'
      
        'Software with a work governed by one or more Secondary Licenses,' +
        ' and the'
      
        'Covered Software is not Incompatible With Secondary Licenses, th' +
        'is'
      
        'License permits You to additionally distribute such Covered Soft' +
        'ware'
      
        'under the terms of such Secondary License(s), so that the recipi' +
        'ent of'
      
        'the Larger Work may, at their option, further distribute the Cov' +
        'ered'
      
        'Software under the terms of either this License or such Secondar' +
        'y'
      'License(s).'
      ''
      '3.4. Notices'
      ''
      'You may not remove or alter the substance of any license notices'
      
        '(including copyright notices, patent notices, disclaimers of war' +
        'ranty,'
      
        'or limitations of liability) contained within the Source Code Fo' +
        'rm of'
      
        'the Covered Software, except that You may alter any license noti' +
        'ces to'
      'the extent required to remedy known factual inaccuracies.'
      ''
      '3.5. Application of Additional Terms'
      ''
      
        'You may choose to offer, and to charge a fee for, warranty, supp' +
        'ort,'
      
        'indemnity or liability obligations to one or more recipients of ' +
        'Covered'
      
        'Software. However, You may do so only on Your own behalf, and no' +
        't on'
      
        'behalf of any Contributor. You must make it absolutely clear tha' +
        't any'
      
        'such warranty, support, indemnity, or liability obligation is of' +
        'fered by'
      
        'You alone, and You hereby agree to indemnify every Contributor f' +
        'or any'
      
        'liability incurred by such Contributor as a result of warranty, ' +
        'support,'
      
        'indemnity or liability terms You offer. You may include addition' +
        'al'
      
        'disclaimers of warranty and limitations of liability specific to' +
        ' any'
      'jurisdiction.'
      ''
      '4. Inability to Comply Due to Statute or Regulation'
      '---------------------------------------------------'
      ''
      
        'If it is impossible for You to comply with any of the terms of t' +
        'his'
      
        'License with respect to some or all of the Covered Software due ' +
        'to'
      
        'statute, judicial order, or regulation then You must: (a) comply' +
        ' with'
      
        'the terms of this License to the maximum extent possible; and (b' +
        ')'
      
        'describe the limitations and the code they affect. Such descript' +
        'ion must'
      
        'be placed in a text file included with all distributions of the ' +
        'Covered'
      
        'Software under this License. Except to the extent prohibited by ' +
        'statute'
      
        'or regulation, such description must be sufficiently detailed fo' +
        'r a'
      'recipient of ordinary skill to be able to understand it.'
      ''
      '5. Termination'
      '--------------'
      ''
      
        '5.1. The rights granted under this License will terminate automa' +
        'tically'
      
        'if You fail to comply with any of its terms. However, if You bec' +
        'ome'
      
        'compliant, then the rights granted under this License from a par' +
        'ticular'
      
        'Contributor are reinstated (a) provisionally, unless and until s' +
        'uch'
      
        'Contributor explicitly and finally terminates Your grants, and (' +
        'b) on an'
      'ongoing basis, if such Contributor fails to notify You of the'
      
        'non-compliance by some reasonable means prior to 60 days after Y' +
        'ou have'
      
        'come back into compliance. Moreover, Your grants from a particul' +
        'ar'
      
        'Contributor are reinstated on an ongoing basis if such Contribut' +
        'or'
      
        'notifies You of the non-compliance by some reasonable means, thi' +
        's is the'
      
        'first time You have received notice of non-compliance with this ' +
        'License'
      
        'from such Contributor, and You become compliant prior to 30 days' +
        ' after'
      'Your receipt of the notice.'
      ''
      
        '5.2. If You initiate litigation against any entity by asserting ' +
        'a patent'
      'infringement claim (excluding declaratory judgment actions,'
      
        'counter-claims, and cross-claims) alleging that a Contributor Ve' +
        'rsion'
      
        'directly or indirectly infringes any patent, then the rights gra' +
        'nted to'
      
        'You by any and all Contributors for the Covered Software under S' +
        'ection'
      '2.1 of this License shall terminate.'
      ''
      
        '5.3. In the event of termination under Sections 5.1 or 5.2 above' +
        ', all'
      
        'end user license agreements (excluding distributors and reseller' +
        's) which'
      
        'have been validly granted by You or Your distributors under this' +
        ' License'
      'prior to termination shall survive termination.'
      ''
      
        '****************************************************************' +
        '********'
      
        '*                                                               ' +
        '       *'
      
        '*  6. Disclaimer of Warranty                                    ' +
        '       *'
      
        '*  -------------------------                                    ' +
        '       *'
      
        '*                                                               ' +
        '       *'
      
        '*  Covered Software is provided under this License on an "as is"' +
        '       *'
      
        '*  basis, without warranty of any kind, either expressed, implie' +
        'd, or  *'
      
        '*  statutory, including, without limitation, warranties that the' +
        '       *'
      
        '*  Covered Software is free of defects, merchantable, fit for a ' +
        '       *'
      
        '*  particular purpose or non-infringing. The entire risk as to t' +
        'he     *'
      
        '*  quality and performance of the Covered Software is with You. ' +
        '       *'
      
        '*  Should any Covered Software prove defective in any respect, Y' +
        'ou     *'
      
        '*  (not any Contributor) assume the cost of any necessary servic' +
        'ing,   *'
      
        '*  repair, or correction. This disclaimer of warranty constitute' +
        's an   *'
      
        '*  essential part of this License. No use of any Covered Softwar' +
        'e is   *'
      
        '*  authorized under this License except under this disclaimer.  ' +
        '       *'
      
        '*                                                               ' +
        '       *'
      
        '****************************************************************' +
        '********'
      ''
      
        '****************************************************************' +
        '********'
      
        '*                                                               ' +
        '       *'
      
        '*  7. Limitation of Liability                                   ' +
        '       *'
      
        '*  --------------------------                                   ' +
        '       *'
      
        '*                                                               ' +
        '       *'
      
        '*  Under no circumstances and under no legal theory, whether tor' +
        't      *'
      
        '*  (including negligence), contract, or otherwise, shall any    ' +
        '       *'
      
        '*  Contributor, or anyone who distributes Covered Software as   ' +
        '       *'
      
        '*  permitted above, be liable to You for any direct, indirect,  ' +
        '       *'
      
        '*  special, incidental, or consequential damages of any characte' +
        'r      *'
      
        '*  including, without limitation, damages for lost profits, loss' +
        ' of    *'
      
        '*  goodwill, work stoppage, computer failure or malfunction, or ' +
        'any    *'
      
        '*  and all other commercial damages or losses, even if such part' +
        'y      *'
      
        '*  shall have been informed of the possibility of such damages. ' +
        'This   *'
      
        '*  limitation of liability shall not apply to liability for deat' +
        'h or   *'
      
        '*  personal injury resulting from such party'#39's negligence to the' +
        '       *'
      
        '*  extent applicable law prohibits such limitation. Some        ' +
        '       *'
      
        '*  jurisdictions do not allow the exclusion or limitation of    ' +
        '       *'
      
        '*  incidental or consequential damages, so this exclusion and   ' +
        '       *'
      
        '*  limitation may not apply to You.                             ' +
        '       *'
      
        '*                                                               ' +
        '       *'
      
        '****************************************************************' +
        '********'
      ''
      '8. Litigation'
      '-------------'
      ''
      
        'Any litigation relating to this License may be brought only in t' +
        'he'
      
        'courts of a jurisdiction where the defendant maintains its princ' +
        'ipal'
      
        'place of business and such litigation shall be governed by laws ' +
        'of that'
      
        'jurisdiction, without reference to its conflict-of-law provision' +
        's.'
      'Nothing in this Section shall prevent a party'#39's ability to bring'
      'cross-claims or counter-claims.'
      ''
      '9. Miscellaneous'
      '----------------'
      ''
      
        'This License represents the complete agreement concerning the su' +
        'bject'
      'matter hereof. If any provision of this License is held to be'
      
        'unenforceable, such provision shall be reformed only to the exte' +
        'nt'
      
        'necessary to make it enforceable. Any law or regulation which pr' +
        'ovides'
      
        'that the language of a contract shall be construed against the d' +
        'rafter'
      
        'shall not be used to construe this License against a Contributor' +
        '.'
      ''
      '10. Versions of the License'
      '---------------------------'
      ''
      '10.1. New Versions'
      ''
      
        'Mozilla Foundation is the license steward. Except as provided in' +
        ' Section'
      
        '10.3, no one other than the license steward has the right to mod' +
        'ify or'
      
        'publish new versions of this License. Each version will be given' +
        ' a'
      'distinguishing version number.'
      ''
      '10.2. Effect of New Versions'
      ''
      
        'You may distribute the Covered Software under the terms of the v' +
        'ersion'
      
        'of the License under which You originally received the Covered S' +
        'oftware,'
      
        'or under the terms of any subsequent version published by the li' +
        'cense'
      'steward.'
      ''
      '10.3. Modified Versions'
      ''
      
        'If you create software not governed by this License, and you wan' +
        't to'
      'create a new license for such software, you may create and use a'
      
        'modified version of this License if you rename the license and r' +
        'emove'
      
        'any references to the name of the license steward (except to not' +
        'e that'
      'such modified license differs from this License).'
      ''
      
        '10.4. Distributing Source Code Form that is Incompatible With Se' +
        'condary'
      'Licenses'
      ''
      
        'If You choose to distribute Source Code Form that is Incompatibl' +
        'e With'
      
        'Secondary Licenses under the terms of this version of the Licens' +
        'e, the'
      'notice described in Exhibit B of this License must be attached.'
      ''
      'Exhibit A - Source Code Form License Notice'
      '-------------------------------------------'
      ''
      
        '  This Source Code Form is subject to the terms of the Mozilla P' +
        'ublic'
      
        '  License, v. 2.0. If a copy of the MPL was not distributed with' +
        ' this'
      '  file, You can obtain one at http://mozilla.org/MPL/2.0/.'
      ''
      
        'If it is not possible or desirable to put the notice in a partic' +
        'ular'
      
        'file, then You may include the notice in a location (such as a L' +
        'ICENSE'
      
        'file in a relevant directory) where a recipient would be likely ' +
        'to look'
      'for such a notice.'
      ''
      'You may add additional accurate notices of copyright ownership.'
      ''
      'Exhibit B - "Incompatible With Secondary Licenses" Notice'
      '---------------------------------------------------------'
      ''
      
        '  This Source Code Form is "Incompatible With Secondary Licenses' +
        '", as'
      '  defined by the Mozilla Public License, v. 2.0.'
      ''
      ''
      '# DEB - Delphi Event Bus'
      ''
      ''
      '                                 Apache License'
      '                           Version 2.0, January 2004'
      '                        http://www.apache.org/licenses/'
      ''
      '   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION'
      ''
      '   1. Definitions.'
      ''
      
        '      "License" shall mean the terms and conditions for use, rep' +
        'roduction,'
      
        '      and distribution as defined by Sections 1 through 9 of thi' +
        's document.'
      ''
      
        '      "Licensor" shall mean the copyright owner or entity author' +
        'ized by'
      '      the copyright owner that is granting the License.'
      ''
      
        '      "Legal Entity" shall mean the union of the acting entity a' +
        'nd all'
      
        '      other entities that control, are controlled by, or are und' +
        'er common'
      
        '      control with that entity. For the purposes of this definit' +
        'ion,'
      
        '      "control" means (i) the power, direct or indirect, to caus' +
        'e the'
      
        '      direction or management of such entity, whether by contrac' +
        't or'
      
        '      otherwise, or (ii) ownership of fifty percent (50%) or mor' +
        'e of the'
      
        '      outstanding shares, or (iii) beneficial ownership of such ' +
        'entity.'
      ''
      '      "You" (or "Your") shall mean an individual or Legal Entity'
      '      exercising permissions granted by this License.'
      ''
      
        '      "Source" form shall mean the preferred form for making mod' +
        'ifications,'
      
        '      including but not limited to software source code, documen' +
        'tation'
      '      source, and configuration files.'
      ''
      
        '      "Object" form shall mean any form resulting from mechanica' +
        'l'
      
        '      transformation or translation of a Source form, including ' +
        'but'
      
        '      not limited to compiled object code, generated documentati' +
        'on,'
      '      and conversions to other media types.'
      ''
      
        '      "Work" shall mean the work of authorship, whether in Sourc' +
        'e or'
      
        '      Object form, made available under the License, as indicate' +
        'd by a'
      
        '      copyright notice that is included in or attached to the wo' +
        'rk'
      '      (an example is provided in the Appendix below).'
      ''
      
        '      "Derivative Works" shall mean any work, whether in Source ' +
        'or Object'
      
        '      form, that is based on (or derived from) the Work and for ' +
        'which the'
      
        '      editorial revisions, annotations, elaborations, or other m' +
        'odifications'
      
        '      represent, as a whole, an original work of authorship. For' +
        ' the purposes'
      
        '      of this License, Derivative Works shall not include works ' +
        'that remain'
      
        '      separable from, or merely link (or bind by name) to the in' +
        'terfaces of,'
      '      the Work and Derivative Works thereof.'
      ''
      
        '      "Contribution" shall mean any work of authorship, includin' +
        'g'
      
        '      the original version of the Work and any modifications or ' +
        'additions'
      
        '      to that Work or Derivative Works thereof, that is intentio' +
        'nally'
      
        '      submitted to Licensor for inclusion in the Work by the cop' +
        'yright owner'
      
        '      or by an individual or Legal Entity authorized to submit o' +
        'n behalf of'
      
        '      the copyright owner. For the purposes of this definition, ' +
        '"submitted"'
      
        '      means any form of electronic, verbal, or written communica' +
        'tion sent'
      
        '      to the Licensor or its representatives, including but not ' +
        'limited to'
      
        '      communication on electronic mailing lists, source code con' +
        'trol systems,'
      
        '      and issue tracking systems that are managed by, or on beha' +
        'lf of, the'
      
        '      Licensor for the purpose of discussing and improving the W' +
        'ork, but'
      
        '      excluding communication that is conspicuously marked or ot' +
        'herwise'
      
        '      designated in writing by the copyright owner as "Not a Con' +
        'tribution."'
      ''
      
        '      "Contributor" shall mean Licensor and any individual or Le' +
        'gal Entity'
      
        '      on behalf of whom a Contribution has been received by Lice' +
        'nsor and'
      '      subsequently incorporated within the Work.'
      ''
      
        '   2. Grant of Copyright License. Subject to the terms and condi' +
        'tions of'
      
        '      this License, each Contributor hereby grants to You a perp' +
        'etual,'
      
        '      worldwide, non-exclusive, no-charge, royalty-free, irrevoc' +
        'able'
      
        '      copyright license to reproduce, prepare Derivative Works o' +
        'f,'
      
        '      publicly display, publicly perform, sublicense, and distri' +
        'bute the'
      '      Work and such Derivative Works in Source or Object form.'
      ''
      
        '   3. Grant of Patent License. Subject to the terms and conditio' +
        'ns of'
      
        '      this License, each Contributor hereby grants to You a perp' +
        'etual,'
      
        '      worldwide, non-exclusive, no-charge, royalty-free, irrevoc' +
        'able'
      
        '      (except as stated in this section) patent license to make,' +
        ' have made,'
      
        '      use, offer to sell, sell, import, and otherwise transfer t' +
        'he Work,'
      
        '      where such license applies only to those patent claims lic' +
        'ensable'
      
        '      by such Contributor that are necessarily infringed by thei' +
        'r'
      
        '      Contribution(s) alone or by combination of their Contribut' +
        'ion(s)'
      
        '      with the Work to which such Contribution(s) was submitted.' +
        ' If You'
      
        '      institute patent litigation against any entity (including ' +
        'a'
      
        '      cross-claim or counterclaim in a lawsuit) alleging that th' +
        'e Work'
      
        '      or a Contribution incorporated within the Work constitutes' +
        ' direct'
      
        '      or contributory patent infringement, then any patent licen' +
        'ses'
      
        '      granted to You under this License for that Work shall term' +
        'inate'
      '      as of the date such litigation is filed.'
      ''
      
        '   4. Redistribution. You may reproduce and distribute copies of' +
        ' the'
      
        '      Work or Derivative Works thereof in any medium, with or wi' +
        'thout'
      
        '      modifications, and in Source or Object form, provided that' +
        ' You'
      '      meet the following conditions:'
      ''
      '      (a) You must give any other recipients of the Work or'
      '          Derivative Works a copy of this License; and'
      ''
      
        '      (b) You must cause any modified files to carry prominent n' +
        'otices'
      '          stating that You changed the files; and'
      ''
      
        '      (c) You must retain, in the Source form of any Derivative ' +
        'Works'
      
        '          that You distribute, all copyright, patent, trademark,' +
        ' and'
      '          attribution notices from the Source form of the Work,'
      
        '          excluding those notices that do not pertain to any par' +
        't of'
      '          the Derivative Works; and'
      ''
      
        '      (d) If the Work includes a "NOTICE" text file as part of i' +
        'ts'
      
        '          distribution, then any Derivative Works that You distr' +
        'ibute must'
      
        '          include a readable copy of the attribution notices con' +
        'tained'
      
        '          within such NOTICE file, excluding those notices that ' +
        'do not'
      
        '          pertain to any part of the Derivative Works, in at lea' +
        'st one'
      
        '          of the following places: within a NOTICE text file dis' +
        'tributed'
      
        '          as part of the Derivative Works; within the Source for' +
        'm or'
      
        '          documentation, if provided along with the Derivative W' +
        'orks; or,'
      
        '          within a display generated by the Derivative Works, if' +
        ' and'
      
        '          wherever such third-party notices normally appear. The' +
        ' contents'
      
        '          of the NOTICE file are for informational purposes only' +
        ' and'
      
        '          do not modify the License. You may add Your own attrib' +
        'ution'
      
        '          notices within Derivative Works that You distribute, a' +
        'longside'
      
        '          or as an addendum to the NOTICE text from the Work, pr' +
        'ovided'
      
        '          that such additional attribution notices cannot be con' +
        'strued'
      '          as modifying the License.'
      ''
      
        '      You may add Your own copyright statement to Your modificat' +
        'ions and'
      
        '      may provide additional or different license terms and cond' +
        'itions'
      
        '      for use, reproduction, or distribution of Your modificatio' +
        'ns, or'
      
        '      for any such Derivative Works as a whole, provided Your us' +
        'e,'
      
        '      reproduction, and distribution of the Work otherwise compl' +
        'ies with'
      '      the conditions stated in this License.'
      ''
      
        '   5. Submission of Contributions. Unless You explicitly state o' +
        'therwise,'
      
        '      any Contribution intentionally submitted for inclusion in ' +
        'the Work'
      
        '      by You to the Licensor shall be under the terms and condit' +
        'ions of'
      '      this License, without any additional terms or conditions.'
      
        '      Notwithstanding the above, nothing herein shall supersede ' +
        'or modify'
      
        '      the terms of any separate license agreement you may have e' +
        'xecuted'
      '      with Licensor regarding such Contributions.'
      ''
      
        '   6. Trademarks. This License does not grant permission to use ' +
        'the trade'
      
        '      names, trademarks, service marks, or product names of the ' +
        'Licensor,'
      
        '      except as required for reasonable and customary use in des' +
        'cribing the'
      
        '      origin of the Work and reproducing the content of the NOTI' +
        'CE file.'
      ''
      
        '   7. Disclaimer of Warranty. Unless required by applicable law ' +
        'or'
      '      agreed to in writing, Licensor provides the Work (and each'
      
        '      Contributor provides its Contributions) on an "AS IS" BASI' +
        'S,'
      
        '      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either expre' +
        'ss or'
      
        '      implied, including, without limitation, any warranties or ' +
        'conditions'
      
        '      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FO' +
        'R A'
      
        '      PARTICULAR PURPOSE. You are solely responsible for determi' +
        'ning the'
      
        '      appropriateness of using or redistributing the Work and as' +
        'sume any'
      
        '      risks associated with Your exercise of permissions under t' +
        'his License.'
      ''
      
        '   8. Limitation of Liability. In no event and under no legal th' +
        'eory,'
      
        '      whether in tort (including negligence), contract, or other' +
        'wise,'
      
        '      unless required by applicable law (such as deliberate and ' +
        'grossly'
      
        '      negligent acts) or agreed to in writing, shall any Contrib' +
        'utor be'
      
        '      liable to You for damages, including any direct, indirect,' +
        ' special,'
      
        '      incidental, or consequential damages of any character aris' +
        'ing as a'
      
        '      result of this License or out of the use or inability to u' +
        'se the'
      
        '      Work (including but not limited to damages for loss of goo' +
        'dwill,'
      
        '      work stoppage, computer failure or malfunction, or any and' +
        ' all'
      
        '      other commercial damages or losses), even if such Contribu' +
        'tor'
      '      has been advised of the possibility of such damages.'
      ''
      
        '   9. Accepting Warranty or Additional Liability. While redistri' +
        'buting'
      
        '      the Work or Derivative Works thereof, You may choose to of' +
        'fer,'
      
        '      and charge a fee for, acceptance of support, warranty, ind' +
        'emnity,'
      
        '      or other liability obligations and/or rights consistent wi' +
        'th this'
      
        '      License. However, in accepting such obligations, You may a' +
        'ct only'
      
        '      on Your own behalf and on Your sole responsibility, not on' +
        ' behalf'
      
        '      of any other Contributor, and only if You agree to indemni' +
        'fy,'
      
        '      defend, and hold each Contributor harmless for any liabili' +
        'ty'
      
        '      incurred by, or claims asserted against, such Contributor ' +
        'by reason'
      
        '      of your accepting any such warranty or additional liabilit' +
        'y.'
      ''
      '   END OF TERMS AND CONDITIONS'
      ''
      '   APPENDIX: How to apply the Apache License to your work.'
      ''
      
        '      To apply the Apache License to your work, attach the follo' +
        'wing'
      
        '      boilerplate notice, with the fields enclosed by brackets "' +
        '{}"'
      
        '      replaced with your own identifying information. (Don'#39't inc' +
        'lude'
      
        '      the brackets!)  The text should be enclosed in the appropr' +
        'iate'
      
        '      comment syntax for the file format. We also recommend that' +
        ' a'
      
        '      file or class name and description of purpose be included ' +
        'on the'
      '      same "printed page" as the copyright notice for easier'
      '      identification within third-party archives.'
      ''
      '   Copyright 2016 Daniele Spinetti'
      ''
      
        '   Licensed under the Apache License, Version 2.0 (the "License"' +
        ');'
      
        '   you may not use this file except in compliance with the Licen' +
        'se.'
      '   You may obtain a copy of the License at'
      ''
      '       http://www.apache.org/licenses/LICENSE-2.0'
      ''
      
        '   Unless required by applicable law or agreed to in writing, so' +
        'ftware'
      
        '   distributed under the License is distributed on an "AS IS" BA' +
        'SIS,'
      
        '   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express ' +
        'or implied.'
      
        '   See the License for the specific language governing permissio' +
        'ns and'
      '   limitations under the License.'
      ''
      ''
      '# Neon - Serialization Library for Delphi'
      ''
      '                                 Apache License'
      '                           Version 2.0, January 2004'
      '                        http://www.apache.org/licenses/'
      ''
      '   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION'
      ''
      '   1. Definitions.'
      ''
      
        '      "License" shall mean the terms and conditions for use, rep' +
        'roduction,'
      
        '      and distribution as defined by Sections 1 through 9 of thi' +
        's document.'
      ''
      
        '      "Licensor" shall mean the copyright owner or entity author' +
        'ized by'
      '      the copyright owner that is granting the License.'
      ''
      
        '      "Legal Entity" shall mean the union of the acting entity a' +
        'nd all'
      
        '      other entities that control, are controlled by, or are und' +
        'er common'
      
        '      control with that entity. For the purposes of this definit' +
        'ion,'
      
        '      "control" means (i) the power, direct or indirect, to caus' +
        'e the'
      
        '      direction or management of such entity, whether by contrac' +
        't or'
      
        '      otherwise, or (ii) ownership of fifty percent (50%) or mor' +
        'e of the'
      
        '      outstanding shares, or (iii) beneficial ownership of such ' +
        'entity.'
      ''
      '      "You" (or "Your") shall mean an individual or Legal Entity'
      '      exercising permissions granted by this License.'
      ''
      
        '      "Source" form shall mean the preferred form for making mod' +
        'ifications,'
      
        '      including but not limited to software source code, documen' +
        'tation'
      '      source, and configuration files.'
      ''
      
        '      "Object" form shall mean any form resulting from mechanica' +
        'l'
      
        '      transformation or translation of a Source form, including ' +
        'but'
      
        '      not limited to compiled object code, generated documentati' +
        'on,'
      '      and conversions to other media types.'
      ''
      
        '      "Work" shall mean the work of authorship, whether in Sourc' +
        'e or'
      
        '      Object form, made available under the License, as indicate' +
        'd by a'
      
        '      copyright notice that is included in or attached to the wo' +
        'rk'
      '      (an example is provided in the Appendix below).'
      ''
      
        '      "Derivative Works" shall mean any work, whether in Source ' +
        'or Object'
      
        '      form, that is based on (or derived from) the Work and for ' +
        'which the'
      
        '      editorial revisions, annotations, elaborations, or other m' +
        'odifications'
      
        '      represent, as a whole, an original work of authorship. For' +
        ' the purposes'
      
        '      of this License, Derivative Works shall not include works ' +
        'that remain'
      
        '      separable from, or merely link (or bind by name) to the in' +
        'terfaces of,'
      '      the Work and Derivative Works thereof.'
      ''
      
        '      "Contribution" shall mean any work of authorship, includin' +
        'g'
      
        '      the original version of the Work and any modifications or ' +
        'additions'
      
        '      to that Work or Derivative Works thereof, that is intentio' +
        'nally'
      
        '      submitted to Licensor for inclusion in the Work by the cop' +
        'yright owner'
      
        '      or by an individual or Legal Entity authorized to submit o' +
        'n behalf of'
      
        '      the copyright owner. For the purposes of this definition, ' +
        '"submitted"'
      
        '      means any form of electronic, verbal, or written communica' +
        'tion sent'
      
        '      to the Licensor or its representatives, including but not ' +
        'limited to'
      
        '      communication on electronic mailing lists, source code con' +
        'trol systems,'
      
        '      and issue tracking systems that are managed by, or on beha' +
        'lf of, the'
      
        '      Licensor for the purpose of discussing and improving the W' +
        'ork, but'
      
        '      excluding communication that is conspicuously marked or ot' +
        'herwise'
      
        '      designated in writing by the copyright owner as "Not a Con' +
        'tribution."'
      ''
      
        '      "Contributor" shall mean Licensor and any individual or Le' +
        'gal Entity'
      
        '      on behalf of whom a Contribution has been received by Lice' +
        'nsor and'
      '      subsequently incorporated within the Work.'
      ''
      
        '   2. Grant of Copyright License. Subject to the terms and condi' +
        'tions of'
      
        '      this License, each Contributor hereby grants to You a perp' +
        'etual,'
      
        '      worldwide, non-exclusive, no-charge, royalty-free, irrevoc' +
        'able'
      
        '      copyright license to reproduce, prepare Derivative Works o' +
        'f,'
      
        '      publicly display, publicly perform, sublicense, and distri' +
        'bute the'
      '      Work and such Derivative Works in Source or Object form.'
      ''
      
        '   3. Grant of Patent License. Subject to the terms and conditio' +
        'ns of'
      
        '      this License, each Contributor hereby grants to You a perp' +
        'etual,'
      
        '      worldwide, non-exclusive, no-charge, royalty-free, irrevoc' +
        'able'
      
        '      (except as stated in this section) patent license to make,' +
        ' have made,'
      
        '      use, offer to sell, sell, import, and otherwise transfer t' +
        'he Work,'
      
        '      where such license applies only to those patent claims lic' +
        'ensable'
      
        '      by such Contributor that are necessarily infringed by thei' +
        'r'
      
        '      Contribution(s) alone or by combination of their Contribut' +
        'ion(s)'
      
        '      with the Work to which such Contribution(s) was submitted.' +
        ' If You'
      
        '      institute patent litigation against any entity (including ' +
        'a'
      
        '      cross-claim or counterclaim in a lawsuit) alleging that th' +
        'e Work'
      
        '      or a Contribution incorporated within the Work constitutes' +
        ' direct'
      
        '      or contributory patent infringement, then any patent licen' +
        'ses'
      
        '      granted to You under this License for that Work shall term' +
        'inate'
      '      as of the date such litigation is filed.'
      ''
      
        '   4. Redistribution. You may reproduce and distribute copies of' +
        ' the'
      
        '      Work or Derivative Works thereof in any medium, with or wi' +
        'thout'
      
        '      modifications, and in Source or Object form, provided that' +
        ' You'
      '      meet the following conditions:'
      ''
      '      (a) You must give any other recipients of the Work or'
      '          Derivative Works a copy of this License; and'
      ''
      
        '      (b) You must cause any modified files to carry prominent n' +
        'otices'
      '          stating that You changed the files; and'
      ''
      
        '      (c) You must retain, in the Source form of any Derivative ' +
        'Works'
      
        '          that You distribute, all copyright, patent, trademark,' +
        ' and'
      '          attribution notices from the Source form of the Work,'
      
        '          excluding those notices that do not pertain to any par' +
        't of'
      '          the Derivative Works; and'
      ''
      
        '      (d) If the Work includes a "NOTICE" text file as part of i' +
        'ts'
      
        '          distribution, then any Derivative Works that You distr' +
        'ibute must'
      
        '          include a readable copy of the attribution notices con' +
        'tained'
      
        '          within such NOTICE file, excluding those notices that ' +
        'do not'
      
        '          pertain to any part of the Derivative Works, in at lea' +
        'st one'
      
        '          of the following places: within a NOTICE text file dis' +
        'tributed'
      
        '          as part of the Derivative Works; within the Source for' +
        'm or'
      
        '          documentation, if provided along with the Derivative W' +
        'orks; or,'
      
        '          within a display generated by the Derivative Works, if' +
        ' and'
      
        '          wherever such third-party notices normally appear. The' +
        ' contents'
      
        '          of the NOTICE file are for informational purposes only' +
        ' and'
      
        '          do not modify the License. You may add Your own attrib' +
        'ution'
      
        '          notices within Derivative Works that You distribute, a' +
        'longside'
      
        '          or as an addendum to the NOTICE text from the Work, pr' +
        'ovided'
      
        '          that such additional attribution notices cannot be con' +
        'strued'
      '          as modifying the License.'
      ''
      
        '      You may add Your own copyright statement to Your modificat' +
        'ions and'
      
        '      may provide additional or different license terms and cond' +
        'itions'
      
        '      for use, reproduction, or distribution of Your modificatio' +
        'ns, or'
      
        '      for any such Derivative Works as a whole, provided Your us' +
        'e,'
      
        '      reproduction, and distribution of the Work otherwise compl' +
        'ies with'
      '      the conditions stated in this License.'
      ''
      
        '   5. Submission of Contributions. Unless You explicitly state o' +
        'therwise,'
      
        '      any Contribution intentionally submitted for inclusion in ' +
        'the Work'
      
        '      by You to the Licensor shall be under the terms and condit' +
        'ions of'
      '      this License, without any additional terms or conditions.'
      
        '      Notwithstanding the above, nothing herein shall supersede ' +
        'or modify'
      
        '      the terms of any separate license agreement you may have e' +
        'xecuted'
      '      with Licensor regarding such Contributions.'
      ''
      
        '   6. Trademarks. This License does not grant permission to use ' +
        'the trade'
      
        '      names, trademarks, service marks, or product names of the ' +
        'Licensor,'
      
        '      except as required for reasonable and customary use in des' +
        'cribing the'
      
        '      origin of the Work and reproducing the content of the NOTI' +
        'CE file.'
      ''
      
        '   7. Disclaimer of Warranty. Unless required by applicable law ' +
        'or'
      '      agreed to in writing, Licensor provides the Work (and each'
      
        '      Contributor provides its Contributions) on an "AS IS" BASI' +
        'S,'
      
        '      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either expre' +
        'ss or'
      
        '      implied, including, without limitation, any warranties or ' +
        'conditions'
      
        '      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FO' +
        'R A'
      
        '      PARTICULAR PURPOSE. You are solely responsible for determi' +
        'ning the'
      
        '      appropriateness of using or redistributing the Work and as' +
        'sume any'
      
        '      risks associated with Your exercise of permissions under t' +
        'his License.'
      ''
      
        '   8. Limitation of Liability. In no event and under no legal th' +
        'eory,'
      
        '      whether in tort (including negligence), contract, or other' +
        'wise,'
      
        '      unless required by applicable law (such as deliberate and ' +
        'grossly'
      
        '      negligent acts) or agreed to in writing, shall any Contrib' +
        'utor be'
      
        '      liable to You for damages, including any direct, indirect,' +
        ' special,'
      
        '      incidental, or consequential damages of any character aris' +
        'ing as a'
      
        '      result of this License or out of the use or inability to u' +
        'se the'
      
        '      Work (including but not limited to damages for loss of goo' +
        'dwill,'
      
        '      work stoppage, computer failure or malfunction, or any and' +
        ' all'
      
        '      other commercial damages or losses), even if such Contribu' +
        'tor'
      '      has been advised of the possibility of such damages.'
      ''
      
        '   9. Accepting Warranty or Additional Liability. While redistri' +
        'buting'
      
        '      the Work or Derivative Works thereof, You may choose to of' +
        'fer,'
      
        '      and charge a fee for, acceptance of support, warranty, ind' +
        'emnity,'
      
        '      or other liability obligations and/or rights consistent wi' +
        'th this'
      
        '      License. However, in accepting such obligations, You may a' +
        'ct only'
      
        '      on Your own behalf and on Your sole responsibility, not on' +
        ' behalf'
      
        '      of any other Contributor, and only if You agree to indemni' +
        'fy,'
      
        '      defend, and hold each Contributor harmless for any liabili' +
        'ty'
      
        '      incurred by, or claims asserted against, such Contributor ' +
        'by reason'
      
        '      of your accepting any such warranty or additional liabilit' +
        'y.'
      ''
      '   END OF TERMS AND CONDITIONS'
      ''
      '   APPENDIX: How to apply the Apache License to your work.'
      ''
      
        '      To apply the Apache License to your work, attach the follo' +
        'wing'
      
        '      boilerplate notice, with the fields enclosed by brackets "' +
        '[]"'
      
        '      replaced with your own identifying information. (Don'#39't inc' +
        'lude'
      
        '      the brackets!)  The text should be enclosed in the appropr' +
        'iate'
      
        '      comment syntax for the file format. We also recommend that' +
        ' a'
      
        '      file or class name and description of purpose be included ' +
        'on the'
      '      same "printed page" as the copyright notice for easier'
      '      identification within third-party archives.'
      ''
      '   Copyright [yyyy] [name of copyright owner]'
      ''
      
        '   Licensed under the Apache License, Version 2.0 (the "License"' +
        ');'
      
        '   you may not use this file except in compliance with the Licen' +
        'se.'
      '   You may obtain a copy of the License at'
      ''
      '       http://www.apache.org/licenses/LICENSE-2.0'
      ''
      
        '   Unless required by applicable law or agreed to in writing, so' +
        'ftware'
      
        '   distributed under the License is distributed on an "AS IS" BA' +
        'SIS,'
      
        '   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express ' +
        'or implied.'
      
        '   See the License for the specific language governing permissio' +
        'ns and'
      '   limitations under the License.'
      ''
      ''
      '# VCL Styles Utils'
      ''
      ' unknown license'
      ' '
      ' '
      '# TurboPack VirtualTree'
      ''
      ' '
      '   MOZILLA PUBLIC LICENSE'
      '                                Version 1.1'
      ''
      '                              ---------------'
      ''
      '1. Definitions.'
      ''
      
        '     1.0.1. "Commercial Use" means distribution or otherwise mak' +
        'ing the'
      '     Covered Code available to a third party.'
      ''
      
        '     1.1. "Contributor" means each entity that creates or contri' +
        'butes to'
      '     the creation of Modifications.'
      ''
      
        '     1.2. "Contributor Version" means the combination of the Ori' +
        'ginal'
      
        '     Code, prior Modifications used by a Contributor, and the Mo' +
        'difications'
      '     made by that particular Contributor.'
      ''
      
        '     1.3. "Covered Code" means the Original Code or Modification' +
        's or the'
      
        '     combination of the Original Code and Modifications, in each' +
        ' case'
      '     including portions thereof.'
      ''
      
        '     1.4. "Electronic Distribution Mechanism" means a mechanism ' +
        'generally'
      
        '     accepted in the software development community for the elec' +
        'tronic'
      '     transfer of data.'
      ''
      
        '     1.5. "Executable" means Covered Code in any form other than' +
        ' Source'
      '     Code.'
      ''
      
        '     1.6. "Initial Developer" means the individual or entity ide' +
        'ntified'
      
        '     as the Initial Developer in the Source Code notice required' +
        ' by Exhibit'
      '     A.'
      ''
      
        '     1.7. "Larger Work" means a work which combines Covered Code' +
        ' or'
      
        '     portions thereof with code not governed by the terms of thi' +
        's License.'
      ''
      '     1.8. "License" means this document.'
      ''
      
        '     1.8.1. "Licensable" means having the right to grant, to the' +
        ' maximum'
      
        '     extent possible, whether at the time of the initial grant o' +
        'r'
      
        '     subsequently acquired, any and all of the rights conveyed h' +
        'erein.'
      ''
      
        '     1.9. "Modifications" means any addition to or deletion from' +
        ' the'
      
        '     substance or structure of either the Original Code or any p' +
        'revious'
      
        '     Modifications. When Covered Code is released as a series of' +
        ' files, a'
      '     Modification is:'
      
        '          A. Any addition to or deletion from the contents of a ' +
        'file'
      '          containing Original Code or previous Modifications.'
      ''
      
        '          B. Any new file that contains any part of the Original' +
        ' Code or'
      '          previous Modifications.'
      ''
      
        '     1.10. "Original Code" means Source Code of computer softwar' +
        'e code'
      
        '     which is described in the Source Code notice required by Ex' +
        'hibit A as'
      
        '     Original Code, and which, at the time of its release under ' +
        'this'
      
        '     License is not already Covered Code governed by this Licens' +
        'e.'
      ''
      
        '     1.10.1. "Patent Claims" means any patent claim(s), now owne' +
        'd or'
      
        '     hereafter acquired, including without limitation,  method, ' +
        'process,'
      '     and apparatus claims, in any patent Licensable by grantor.'
      ''
      
        '     1.11. "Source Code" means the preferred form of the Covered' +
        ' Code for'
      
        '     making modifications to it, including all modules it contai' +
        'ns, plus'
      
        '     any associated interface definition files, scripts used to ' +
        'control'
      
        '     compilation and installation of an Executable, or source co' +
        'de'
      
        '     differential comparisons against either the Original Code o' +
        'r another'
      
        '     well known, available Covered Code of the Contributor'#39's cho' +
        'ice. The'
      
        '     Source Code can be in a compressed or archival form, provid' +
        'ed the'
      
        '     appropriate decompression or de-archiving software is widel' +
        'y available'
      '     for no charge.'
      ''
      
        '     1.12. "You" (or "Your")  means an individual or a legal ent' +
        'ity'
      
        '     exercising rights under, and complying with all of the term' +
        's of, this'
      
        '     License or a future version of this License issued under Se' +
        'ction 6.1.'
      
        '     For legal entities, "You" includes any entity which control' +
        's, is'
      
        '     controlled by, or is under common control with You. For pur' +
        'poses of'
      
        '     this definition, "control" means (a) the power, direct or i' +
        'ndirect,'
      
        '     to cause the direction or management of such entity, whethe' +
        'r by'
      
        '     contract or otherwise, or (b) ownership of more than fifty ' +
        'percent'
      
        '     (50%) of the outstanding shares or beneficial ownership of ' +
        'such'
      '     entity.'
      ''
      '2. Source Code License.'
      ''
      '     2.1. The Initial Developer Grant.'
      
        '     The Initial Developer hereby grants You a world-wide, royal' +
        'ty-free,'
      
        '     non-exclusive license, subject to third party intellectual ' +
        'property'
      '     claims:'
      
        '          (a)  under intellectual property rights (other than pa' +
        'tent or'
      
        '          trademark) Licensable by Initial Developer to use, rep' +
        'roduce,'
      
        '          modify, display, perform, sublicense and distribute th' +
        'e Original'
      
        '          Code (or portions thereof) with or without Modificatio' +
        'ns, and/or'
      '          as part of a Larger Work; and'
      ''
      
        '          (b) under Patents Claims infringed by the making, usin' +
        'g or'
      
        '          selling of Original Code, to make, have made, use, pra' +
        'ctice,'
      
        '          sell, and offer for sale, and/or otherwise dispose of ' +
        'the'
      '          Original Code (or portions thereof).'
      ''
      
        '          (c) the licenses granted in this Section 2.1(a) and (b' +
        ') are'
      
        '          effective on the date Initial Developer first distribu' +
        'tes'
      '          Original Code under the terms of this License.'
      ''
      
        '          (d) Notwithstanding Section 2.1(b) above, no patent li' +
        'cense is'
      
        '          granted: 1) for code that You delete from the Original' +
        ' Code; 2)'
      
        '          separate from the Original Code;  or 3) for infringeme' +
        'nts caused'
      
        '          by: i) the modification of the Original Code or ii) th' +
        'e'
      
        '          combination of the Original Code with other software o' +
        'r devices.'
      ''
      '     2.2. Contributor Grant.'
      
        '     Subject to third party intellectual property claims, each C' +
        'ontributor'
      
        '     hereby grants You a world-wide, royalty-free, non-exclusive' +
        ' license'
      ''
      
        '          (a)  under intellectual property rights (other than pa' +
        'tent or'
      
        '          trademark) Licensable by Contributor, to use, reproduc' +
        'e, modify,'
      
        '          display, perform, sublicense and distribute the Modifi' +
        'cations'
      
        '          created by such Contributor (or portions thereof) eith' +
        'er on an'
      
        '          unmodified basis, with other Modifications, as Covered' +
        ' Code'
      '          and/or as part of a Larger Work; and'
      ''
      
        '          (b) under Patent Claims infringed by the making, using' +
        ', or'
      
        '          selling of  Modifications made by that Contributor eit' +
        'her alone'
      
        '          and/or in combination with its Contributor Version (or' +
        ' portions'
      
        '          of such combination), to make, use, sell, offer for sa' +
        'le, have'
      
        '          made, and/or otherwise dispose of: 1) Modifications ma' +
        'de by that'
      
        '          Contributor (or portions thereof); and 2) the combinat' +
        'ion of'
      
        '          Modifications made by that Contributor with its Contri' +
        'butor'
      '          Version (or portions of such combination).'
      ''
      
        '          (c) the licenses granted in Sections 2.2(a) and 2.2(b)' +
        ' are'
      
        '          effective on the date Contributor first makes Commerci' +
        'al Use of'
      '          the Covered Code.'
      ''
      
        '          (d)    Notwithstanding Section 2.2(b) above, no patent' +
        ' license is'
      
        '          granted: 1) for any code that Contributor has deleted ' +
        'from the'
      
        '          Contributor Version; 2)  separate from the Contributor' +
        ' Version;'
      
        '          3)  for infringements caused by: i) third party modifi' +
        'cations of'
      
        '          Contributor Version or ii)  the combination of Modific' +
        'ations made'
      
        '          by that Contributor with other software  (except as pa' +
        'rt of the'
      
        '          Contributor Version) or other devices; or 4) under Pat' +
        'ent Claims'
      
        '          infringed by Covered Code in the absence of Modificati' +
        'ons made by'
      '          that Contributor.'
      ''
      '3. Distribution Obligations.'
      ''
      '     3.1. Application of License.'
      
        '     The Modifications which You create or to which You contribu' +
        'te are'
      
        '     governed by the terms of this License, including without li' +
        'mitation'
      '     Section 2.2. The Source Code version of Covered Code may be'
      
        '     distributed only under the terms of this License or a futur' +
        'e version'
      
        '     of this License released under Section 6.1, and You must in' +
        'clude a'
      '     copy of this License with every copy of the Source Code You'
      
        '     distribute. You may not offer or impose any terms on any So' +
        'urce Code'
      
        '     version that alters or restricts the applicable version of ' +
        'this'
      
        '     License or the recipients'#39' rights hereunder. However, You m' +
        'ay include'
      
        '     an additional document offering the additional rights descr' +
        'ibed in'
      '     Section 3.5.'
      ''
      '     3.2. Availability of Source Code.'
      
        '     Any Modification which You create or to which You contribut' +
        'e must be'
      
        '     made available in Source Code form under the terms of this ' +
        'License'
      
        '     either on the same media as an Executable version or via an' +
        ' accepted'
      
        '     Electronic Distribution Mechanism to anyone to whom you mad' +
        'e an'
      
        '     Executable version available; and if made available via Ele' +
        'ctronic'
      
        '     Distribution Mechanism, must remain available for at least ' +
        'twelve (12)'
      
        '     months after the date it initially became available, or at ' +
        'least six'
      
        '     (6) months after a subsequent version of that particular Mo' +
        'dification'
      
        '     has been made available to such recipients. You are respons' +
        'ible for'
      
        '     ensuring that the Source Code version remains available eve' +
        'n if the'
      
        '     Electronic Distribution Mechanism is maintained by a third ' +
        'party.'
      ''
      '     3.3. Description of Modifications.'
      
        '     You must cause all Covered Code to which You contribute to ' +
        'contain a'
      
        '     file documenting the changes You made to create that Covere' +
        'd Code and'
      
        '     the date of any change. You must include a prominent statem' +
        'ent that'
      
        '     the Modification is derived, directly or indirectly, from O' +
        'riginal'
      
        '     Code provided by the Initial Developer and including the na' +
        'me of the'
      
        '     Initial Developer in (a) the Source Code, and (b) in any no' +
        'tice in an'
      
        '     Executable version or related documentation in which You de' +
        'scribe the'
      '     origin or ownership of the Covered Code.'
      ''
      '     3.4. Intellectual Property Matters'
      '          (a) Third Party Claims.'
      
        '          If Contributor has knowledge that a license under a th' +
        'ird party'#39's'
      
        '          intellectual property rights is required to exercise t' +
        'he rights'
      '          granted by such Contributor under Sections 2.1 or 2.2,'
      
        '          Contributor must include a text file with the Source C' +
        'ode'
      
        '          distribution titled "LEGAL" which describes the claim ' +
        'and the'
      
        '          party making the claim in sufficient detail that a rec' +
        'ipient will'
      
        '          know whom to contact. If Contributor obtains such know' +
        'ledge after'
      
        '          the Modification is made available as described in Sec' +
        'tion 3.2,'
      
        '          Contributor shall promptly modify the LEGAL file in al' +
        'l copies'
      
        '          Contributor makes available thereafter and shall take ' +
        'other steps'
      
        '          (such as notifying appropriate mailing lists or newsgr' +
        'oups)'
      
        '          reasonably calculated to inform those who received the' +
        ' Covered'
      '          Code that new knowledge has been obtained.'
      ''
      '          (b) Contributor APIs.'
      
        '          If Contributor'#39's Modifications include an application ' +
        'programming'
      
        '          interface and Contributor has knowledge of patent lice' +
        'nses which'
      
        '          are reasonably necessary to implement that API, Contri' +
        'butor must'
      '          also include this information in the LEGAL file.'
      ''
      '               (c)    Representations.'
      
        '          Contributor represents that, except as disclosed pursu' +
        'ant to'
      
        '          Section 3.4(a) above, Contributor believes that Contri' +
        'butor'#39's'
      
        '          Modifications are Contributor'#39's original creation(s) a' +
        'nd/or'
      
        '          Contributor has sufficient rights to grant the rights ' +
        'conveyed by'
      '          this License.'
      ''
      '     3.5. Required Notices.'
      
        '     You must duplicate the notice in Exhibit A in each file of ' +
        'the Source'
      
        '     Code.  If it is not possible to put such notice in a partic' +
        'ular Source'
      
        '     Code file due to its structure, then You must include such ' +
        'notice in a'
      
        '     location (such as a relevant directory) where a user would ' +
        'be likely'
      
        '     to look for such a notice.  If You created one or more Modi' +
        'fication(s)'
      
        '     You may add your name as a Contributor to the notice descri' +
        'bed in'
      
        '     Exhibit A.  You must also duplicate this License in any doc' +
        'umentation'
      
        '     for the Source Code where You describe recipients'#39' rights o' +
        'r ownership'
      
        '     rights relating to Covered Code.  You may choose to offer, ' +
        'and to'
      '     charge a fee for, warranty, support, indemnity or liability'
      
        '     obligations to one or more recipients of Covered Code. Howe' +
        'ver, You'
      
        '     may do so only on Your own behalf, and not on behalf of the' +
        ' Initial'
      
        '     Developer or any Contributor. You must make it absolutely c' +
        'lear than'
      
        '     any such warranty, support, indemnity or liability obligati' +
        'on is'
      
        '     offered by You alone, and You hereby agree to indemnify the' +
        ' Initial'
      
        '     Developer and every Contributor for any liability incurred ' +
        'by the'
      
        '     Initial Developer or such Contributor as a result of warran' +
        'ty,'
      '     support, indemnity or liability terms You offer.'
      ''
      '     3.6. Distribution of Executable Versions.'
      
        '     You may distribute Covered Code in Executable form only if ' +
        'the'
      
        '     requirements of Section 3.1-3.5 have been met for that Cove' +
        'red Code,'
      
        '     and if You include a notice stating that the Source Code ve' +
        'rsion of'
      
        '     the Covered Code is available under the terms of this Licen' +
        'se,'
      
        '     including a description of how and where You have fulfilled' +
        ' the'
      
        '     obligations of Section 3.2. The notice must be conspicuousl' +
        'y included'
      
        '     in any notice in an Executable version, related documentati' +
        'on or'
      
        '     collateral in which You describe recipients'#39' rights relatin' +
        'g to the'
      
        '     Covered Code. You may distribute the Executable version of ' +
        'Covered'
      
        '     Code or ownership rights under a license of Your choice, wh' +
        'ich may'
      
        '     contain terms different from this License, provided that Yo' +
        'u are in'
      
        '     compliance with the terms of this License and that the lice' +
        'nse for the'
      
        '     Executable version does not attempt to limit or alter the r' +
        'ecipient'#39's'
      
        '     rights in the Source Code version from the rights set forth' +
        ' in this'
      
        '     License. If You distribute the Executable version under a d' +
        'ifferent'
      
        '     license You must make it absolutely clear that any terms wh' +
        'ich differ'
      
        '     from this License are offered by You alone, not by the Init' +
        'ial'
      
        '     Developer or any Contributor. You hereby agree to indemnify' +
        ' the'
      
        '     Initial Developer and every Contributor for any liability i' +
        'ncurred by'
      
        '     the Initial Developer or such Contributor as a result of an' +
        'y such'
      '     terms You offer.'
      ''
      '     3.7. Larger Works.'
      
        '     You may create a Larger Work by combining Covered Code with' +
        ' other code'
      
        '     not governed by the terms of this License and distribute th' +
        'e Larger'
      
        '     Work as a single product. In such a case, You must make sur' +
        'e the'
      
        '     requirements of this License are fulfilled for the Covered ' +
        'Code.'
      ''
      '4. Inability to Comply Due to Statute or Regulation.'
      ''
      
        '     If it is impossible for You to comply with any of the terms' +
        ' of this'
      
        '     License with respect to some or all of the Covered Code due' +
        ' to'
      
        '     statute, judicial order, or regulation then You must: (a) c' +
        'omply with'
      
        '     the terms of this License to the maximum extent possible; a' +
        'nd (b)'
      
        '     describe the limitations and the code they affect. Such des' +
        'cription'
      
        '     must be included in the LEGAL file described in Section 3.4' +
        ' and must'
      
        '     be included with all distributions of the Source Code. Exce' +
        'pt to the'
      
        '     extent prohibited by statute or regulation, such descriptio' +
        'n must be'
      
        '     sufficiently detailed for a recipient of ordinary skill to ' +
        'be able to'
      '     understand it.'
      ''
      '5. Application of this License.'
      ''
      
        '     This License applies to code to which the Initial Developer' +
        ' has'
      
        '     attached the notice in Exhibit A and to related Covered Cod' +
        'e.'
      ''
      '6. Versions of the License.'
      ''
      '     6.1. New Versions.'
      
        '     Netscape Communications Corporation ("Netscape") may publis' +
        'h revised'
      
        '     and/or new versions of the License from time to time. Each ' +
        'version'
      '     will be given a distinguishing version number.'
      ''
      '     6.2. Effect of New Versions.'
      
        '     Once Covered Code has been published under a particular ver' +
        'sion of the'
      
        '     License, You may always continue to use it under the terms ' +
        'of that'
      
        '     version. You may also choose to use such Covered Code under' +
        ' the terms'
      
        '     of any subsequent version of the License published by Netsc' +
        'ape. No one'
      
        '     other than Netscape has the right to modify the terms appli' +
        'cable to'
      '     Covered Code created under this License.'
      ''
      '     6.3. Derivative Works.'
      
        '     If You create or use a modified version of this License (wh' +
        'ich you may'
      
        '     only do in order to apply it to code which is not already C' +
        'overed Code'
      
        '     governed by this License), You must (a) rename Your license' +
        ' so that'
      '     the phrases "Mozilla", "MOZILLAPL", "MOZPL", "Netscape",'
      
        '     "MPL", "NPL" or any confusingly similar phrase do not appea' +
        'r in your'
      
        '     license (except to note that your license differs from this' +
        ' License)'
      
        '     and (b) otherwise make it clear that Your version of the li' +
        'cense'
      
        '     contains terms which differ from the Mozilla Public License' +
        ' and'
      
        '     Netscape Public License. (Filling in the name of the Initia' +
        'l'
      
        '     Developer, Original Code or Contributor in the notice descr' +
        'ibed in'
      
        '     Exhibit A shall not of themselves be deemed to be modificat' +
        'ions of'
      '     this License.)'
      ''
      '7. DISCLAIMER OF WARRANTY.'
      ''
      
        '     COVERED CODE IS PROVIDED UNDER THIS LICENSE ON AN "AS IS" B' +
        'ASIS,'
      
        '     WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, ' +
        'INCLUDING,'
      
        '     WITHOUT LIMITATION, WARRANTIES THAT THE COVERED CODE IS FRE' +
        'E OF'
      
        '     DEFECTS, MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE OR NON-' +
        'INFRINGING.'
      
        '     THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE CO' +
        'VERED CODE'
      
        '     IS WITH YOU. SHOULD ANY COVERED CODE PROVE DEFECTIVE IN ANY' +
        ' RESPECT,'
      
        '     YOU (NOT THE INITIAL DEVELOPER OR ANY OTHER CONTRIBUTOR) AS' +
        'SUME THE'
      
        '     COST OF ANY NECESSARY SERVICING, REPAIR OR CORRECTION. THIS' +
        ' DISCLAIMER'
      
        '     OF WARRANTY CONSTITUTES AN ESSENTIAL PART OF THIS LICENSE. ' +
        'NO USE OF'
      
        '     ANY COVERED CODE IS AUTHORIZED HEREUNDER EXCEPT UNDER THIS ' +
        'DISCLAIMER.'
      ''
      '8. TERMINATION.'
      ''
      
        '     8.1.  This License and the rights granted hereunder will te' +
        'rminate'
      
        '     automatically if You fail to comply with terms herein and f' +
        'ail to cure'
      
        '     such breach within 30 days of becoming aware of the breach.' +
        ' All'
      
        '     sublicenses to the Covered Code which are properly granted ' +
        'shall'
      
        '     survive any termination of this License. Provisions which, ' +
        'by their'
      
        '     nature, must remain in effect beyond the termination of thi' +
        's License'
      '     shall survive.'
      ''
      
        '     8.2.  If You initiate litigation by asserting a patent infr' +
        'ingement'
      
        '     claim (excluding declatory judgment actions) against Initia' +
        'l Developer'
      
        '     or a Contributor (the Initial Developer or Contributor agai' +
        'nst whom'
      
        '     You file such action is referred to as "Participant")  alle' +
        'ging that:'
      ''
      
        '     (a)  such Participant'#39's Contributor Version directly or ind' +
        'irectly'
      
        '     infringes any patent, then any and all rights granted by su' +
        'ch'
      
        '     Participant to You under Sections 2.1 and/or 2.2 of this Li' +
        'cense'
      
        '     shall, upon 60 days notice from Participant terminate prosp' +
        'ectively,'
      
        '     unless if within 60 days after receipt of notice You either' +
        ': (i)'
      
        '     agree in writing to pay Participant a mutually agreeable re' +
        'asonable'
      
        '     royalty for Your past and future use of Modifications made ' +
        'by such'
      
        '     Participant, or (ii) withdraw Your litigation claim with re' +
        'spect to'
      
        '     the Contributor Version against such Participant.  If withi' +
        'n 60 days'
      
        '     of notice, a reasonable royalty and payment arrangement are' +
        ' not'
      
        '     mutually agreed upon in writing by the parties or the litig' +
        'ation claim'
      
        '     is not withdrawn, the rights granted by Participant to You ' +
        'under'
      
        '     Sections 2.1 and/or 2.2 automatically terminate at the expi' +
        'ration of'
      '     the 60 day notice period specified above.'
      ''
      
        '     (b)  any software, hardware, or device, other than such Par' +
        'ticipant'#39's'
      
        '     Contributor Version, directly or indirectly infringes any p' +
        'atent, then'
      
        '     any rights granted to You by such Participant under Section' +
        's 2.1(b)'
      
        '     and 2.2(b) are revoked effective as of the date You first m' +
        'ade, used,'
      '     sold, distributed, or had made, Modifications made by that'
      '     Participant.'
      ''
      
        '     8.3.  If You assert a patent infringement claim against Par' +
        'ticipant'
      
        '     alleging that such Participant'#39's Contributor Version direct' +
        'ly or'
      
        '     indirectly infringes any patent where such claim is resolve' +
        'd (such as'
      '     by license or settlement) prior to the initiation of patent'
      
        '     infringement litigation, then the reasonable value of the l' +
        'icenses'
      
        '     granted by such Participant under Sections 2.1 or 2.2 shall' +
        ' be taken'
      
        '     into account in determining the amount or value of any paym' +
        'ent or'
      '     license.'
      ''
      
        '     8.4.  In the event of termination under Sections 8.1 or 8.2' +
        ' above,'
      
        '     all end user license agreements (excluding distributors and' +
        ' resellers)'
      
        '     which have been validly granted by You or any distributor h' +
        'ereunder'
      '     prior to termination shall survive termination.'
      ''
      '9. LIMITATION OF LIABILITY.'
      ''
      
        '     UNDER NO CIRCUMSTANCES AND UNDER NO LEGAL THEORY, WHETHER T' +
        'ORT'
      
        '     (INCLUDING NEGLIGENCE), CONTRACT, OR OTHERWISE, SHALL YOU, ' +
        'THE INITIAL'
      
        '     DEVELOPER, ANY OTHER CONTRIBUTOR, OR ANY DISTRIBUTOR OF COV' +
        'ERED CODE,'
      
        '     OR ANY SUPPLIER OF ANY OF SUCH PARTIES, BE LIABLE TO ANY PE' +
        'RSON FOR'
      
        '     ANY INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES' +
        ' OF ANY'
      
        '     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS O' +
        'F GOODWILL,'
      
        '     WORK STOPPAGE, COMPUTER FAILURE OR MALFUNCTION, OR ANY AND ' +
        'ALL OTHER'
      
        '     COMMERCIAL DAMAGES OR LOSSES, EVEN IF SUCH PARTY SHALL HAVE' +
        ' BEEN'
      
        '     INFORMED OF THE POSSIBILITY OF SUCH DAMAGES. THIS LIMITATIO' +
        'N OF'
      
        '     LIABILITY SHALL NOT APPLY TO LIABILITY FOR DEATH OR PERSONA' +
        'L INJURY'
      
        '     RESULTING FROM SUCH PARTY'#39'S NEGLIGENCE TO THE EXTENT APPLIC' +
        'ABLE LAW'
      
        '     PROHIBITS SUCH LIMITATION. SOME JURISDICTIONS DO NOT ALLOW ' +
        'THE'
      
        '     EXCLUSION OR LIMITATION OF INCIDENTAL OR CONSEQUENTIAL DAMA' +
        'GES, SO'
      '     THIS EXCLUSION AND LIMITATION MAY NOT APPLY TO YOU.'
      ''
      '10. U.S. GOVERNMENT END USERS.'
      ''
      
        '     The Covered Code is a "commercial item," as that term is de' +
        'fined in'
      
        '     48 C.F.R. 2.101 (Oct. 1995), consisting of "commercial comp' +
        'uter'
      
        '     software" and "commercial computer software documentation,"' +
        ' as such'
      
        '     terms are used in 48 C.F.R. 12.212 (Sept. 1995). Consistent' +
        ' with 48'
      
        '     C.F.R. 12.212 and 48 C.F.R. 227.7202-1 through 227.7202-4 (' +
        'June 1995),'
      
        '     all U.S. Government End Users acquire Covered Code with onl' +
        'y those'
      '     rights set forth herein.'
      ''
      '11. MISCELLANEOUS.'
      ''
      
        '     This License represents the complete agreement concerning s' +
        'ubject'
      
        '     matter hereof. If any provision of this License is held to ' +
        'be'
      
        '     unenforceable, such provision shall be reformed only to the' +
        ' extent'
      
        '     necessary to make it enforceable. This License shall be gov' +
        'erned by'
      
        '     California law provisions (except to the extent applicable ' +
        'law, if'
      
        '     any, provides otherwise), excluding its conflict-of-law pro' +
        'visions.'
      
        '     With respect to disputes in which at least one party is a c' +
        'itizen of,'
      
        '     or an entity chartered or registered to do business in the ' +
        'United'
      
        '     States of America, any litigation relating to this License ' +
        'shall be'
      
        '     subject to the jurisdiction of the Federal Courts of the No' +
        'rthern'
      
        '     District of California, with venue lying in Santa Clara Cou' +
        'nty,'
      
        '     California, with the losing party responsible for costs, in' +
        'cluding'
      
        '     without limitation, court costs and reasonable attorneys'#39' f' +
        'ees and'
      
        '     expenses. The application of the United Nations Convention ' +
        'on'
      
        '     Contracts for the International Sale of Goods is expressly ' +
        'excluded.'
      
        '     Any law or regulation which provides that the language of a' +
        ' contract'
      
        '     shall be construed against the drafter shall not apply to t' +
        'his'
      '     License.'
      ''
      '12. RESPONSIBILITY FOR CLAIMS.'
      ''
      
        '     As between Initial Developer and the Contributors, each par' +
        'ty is'
      
        '     responsible for claims and damages arising, directly or ind' +
        'irectly,'
      
        '     out of its utilization of rights under this License and You' +
        ' agree to'
      
        '     work with Initial Developer and Contributors to distribute ' +
        'such'
      
        '     responsibility on an equitable basis. Nothing herein is int' +
        'ended or'
      '     shall be deemed to constitute any admission of liability.'
      ''
      '13. MULTIPLE-LICENSED CODE.'
      ''
      
        '     Initial Developer may designate portions of the Covered Cod' +
        'e as'
      
        '     "Multiple-Licensed".  "Multiple-Licensed" means that the In' +
        'itial'
      
        '     Developer permits you to utilize portions of the Covered Co' +
        'de under'
      
        '     Your choice of the MPL or the alternative licenses, if any,' +
        ' specified'
      
        '     by the Initial Developer in the file described in Exhibit A' +
        '.'
      ''
      'EXHIBIT A -Mozilla Public License.'
      ''
      
        '     ``The contents of this file are subject to the Mozilla Publ' +
        'ic License'
      
        '     Version 1.1 (the "License"); you may not use this file exce' +
        'pt in'
      
        '     compliance with the License. You may obtain a copy of the L' +
        'icense at'
      '     http://www.mozilla.org/MPL/'
      ''
      
        '     Software distributed under the License is distributed on an' +
        ' "AS IS"'
      
        '     basis, WITHOUT WARRANTY OF ANY KIND, either express or impl' +
        'ied. See the'
      
        '     License for the specific language governing rights and limi' +
        'tations'
      '     under the License.'
      ''
      
        '     The Original Code is ______________________________________' +
        '.'
      ''
      
        '     The Initial Developer of the Original Code is _____________' +
        '___________.'
      
        '     Portions created by ______________________ are Copyright (C' +
        ') ______'
      '     _______________________. All Rights Reserved.'
      ''
      '     Contributor(s): ______________________________________.'
      ''
      
        '     Alternatively, the contents of this file may be used under ' +
        'the terms'
      
        '     of the _____ license (the  "[___] License"), in which case ' +
        'the'
      
        '     provisions of [______] License are applicable instead of th' +
        'ose'
      
        '     above.  If you wish to allow use of your version of this fi' +
        'le only'
      
        '     under the terms of the [____] License and not to allow othe' +
        'rs to use'
      
        '     your version of this file under the MPL, indicate your deci' +
        'sion by'
      
        '     deleting  the provisions above and replace  them with the n' +
        'otice and'
      
        '     other provisions required by the [___] License.  If you do ' +
        'not delete'
      
        '     the provisions above, a recipient may use your version of t' +
        'his file'
      '     under either the MPL or the [___] License."'
      ''
      
        '     [NOTE: The text of this Exhibit A may differ slightly from ' +
        'the text of'
      
        '     the notices in the Source Code files of the Original Code. ' +
        'You should'
      
        '     use the text of this Exhibit A rather than the text found i' +
        'n the'
      '     Original Code Source Code for Your Modifications.]')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
