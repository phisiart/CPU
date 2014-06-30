
# parsetab.py
# This file is automatically generated. Do not edit.
_tabversion = '3.2'

_lr_method = 'LALR'

_lr_signature = 'l\xff\x8fD\x81\x86\xe8&q\xb5\xecO\x99\xec\xe2D'
    
_lr_action_items = {'AND':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[1,-2,1,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'ADDU':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[2,-2,2,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'SUBU':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[10,-2,10,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'XOR':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[3,-2,3,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'SUB':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[4,-2,4,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'SW':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[6,-2,6,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'NUMBER':([15,19,20,24,28,],[28,32,33,36,-14,]),'LBRACKET':([32,33,],[43,44,]),'LW':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[7,-2,7,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'ADD':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[8,-2,8,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'REGPREFIX':([1,2,3,4,6,7,8,10,11,12,13,14,16,17,18,21,23,25,26,27,28,29,30,31,34,35,37,38,43,44,],[15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,-14,15,15,15,15,15,15,15,15,15,]),'LUI':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[11,-2,11,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'RBRACKET':([28,49,50,],[-14,51,52,]),'OR':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[12,-2,12,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'NOR':([0,5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[13,-2,13,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),'$end':([5,9,22,28,36,39,40,41,42,45,46,47,48,51,52,],[-2,0,-1,-14,-5,-10,-7,-12,-8,-6,-9,-11,-13,-4,-3,]),}

_lr_action = { }
for _k, _v in _lr_action_items.items():
   for _x,_y in zip(_v[0],_v[1]):
      if not _x in _lr_action:  _lr_action[_x] = { }
      _lr_action[_x][_k] = _y
del _lr_action_items

_lr_goto_items = {'program':([0,],[9,]),'instruction':([0,9,],[5,22,]),'register':([1,2,3,4,6,7,8,10,11,12,13,14,16,17,18,21,23,25,26,27,29,30,31,34,35,37,38,43,44,],[14,16,17,18,19,20,21,23,24,25,26,27,29,30,31,34,35,37,38,39,40,41,42,45,46,47,48,49,50,]),}

_lr_goto = { }
for _k, _v in _lr_goto_items.items():
   for _x,_y in zip(_v[0],_v[1]):
       if not _x in _lr_goto: _lr_goto[_x] = { }
       _lr_goto[_x][_k] = _y
del _lr_goto_items
_lr_productions = [
  ("S' -> program","S'",1,None,None,None),
  ('program -> program instruction','program',2,'p_program','parser.py',20),
  ('program -> instruction','program',1,'p_program','parser.py',21),
  ('instruction -> LW register NUMBER LBRACKET register RBRACKET','instruction',6,'p_lw','parser.py',32),
  ('instruction -> SW register NUMBER LBRACKET register RBRACKET','instruction',6,'p_sw','parser.py',40),
  ('instruction -> LUI register NUMBER','instruction',3,'p_lui','parser.py',48),
  ('instruction -> ADD register register register','instruction',4,'p_add','parser.py',56),
  ('instruction -> ADDU register register register','instruction',4,'p_addu','parser.py',64),
  ('instruction -> SUB register register register','instruction',4,'p_sub','parser.py',72),
  ('instruction -> SUBU register register register','instruction',4,'p_subu','parser.py',80),
  ('instruction -> AND register register register','instruction',4,'p_and','parser.py',94),
  ('instruction -> OR register register register','instruction',4,'p_or','parser.py',102),
  ('instruction -> XOR register register register','instruction',4,'p_xor','parser.py',110),
  ('instruction -> NOR register register register','instruction',4,'p_nor','parser.py',118),
  ('register -> REGPREFIX NUMBER','register',2,'p_register','parser.py',174),
]
