let contents = "(* Example: quick sort *)\n\ntype 'a list = [] | :: of 'a * 'a list\n\nlet rec foldr f xs acc = match xs with\n  | [] -> acc\n  | x :: xs -> f x (foldr f xs acc)\n\nlet length xs = foldr (fun _ acc -> acc + 1) xs 0\nlet append xs ys = foldr (fun y acc -> y :: acc) xs ys\nlet filter f xs = foldr (fun x acc -> if f x then x :: acc else acc) xs []\n\nlet rec qsort xs = match xs with\n  | [] -> []\n  | [x] -> [x]\n  | pivot :: rest ->\n    let ys = qsort (filter (fun x -> x < pivot) rest) in\n    let zs = qsort (filter (fun x -> x >= pivot) rest) in\n    append ys (pivot :: zs)\n\nlet rec nth i xs = match xs with\n  | [] -> error\n  | x :: xs -> if i = 0 then x else nth (i-1) xs\n\nlet l1 = [5; 4; 8; 1; 6; 3; 7; 2]\nlet l2 = qsort l1\nlet x0 = nth 0 l2\nlet x1 = nth 1 l2\nlet x2 = nth 2 l2\nlet x3 = nth 3 l2\nlet x4 = nth 4 l2\nlet x5 = nth 5 l2\nlet x6 = nth 6 l2\nlet x7 = nth 7 l2\n\n(*!\n// This is C++ code.\n\n#include <cstdio>\n\nint main () { // We use printf in order to output readable assembly code.\n  std::printf(\"%d  \", x0::val);\n  std::printf(\"%d  \", x1::val);\n  std::printf(\"%d  \", x2::val);\n  std::printf(\"%d  \", x3::val);\n  std::printf(\"%d  \", x4::val);\n  std::printf(\"%d  \", x5::val);\n  std::printf(\"%d  \", x6::val);\n  std::printf(\"%d\\n\", x7::val);\n  return 0;\n}\n*)\n"
