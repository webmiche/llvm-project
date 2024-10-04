from core import AAInstrumentationDriver, register_arguments
from dataclasses import dataclass, field
import sys
from pathlib import Path
from typing import Dict, List
import random
import math
from multiprocessing import Pool
import shutil


rel_seq_644 = [1, 3, 7, 10, 11, 13, 18, 19, 20, 21, 23, 26, 29, 30, 33, 34, 35, 36, 40, 41, 42, 44, 45, 46, 47, 48, 51, 55, 57, 58, 59, 61, 63, 66, 67, 69, 72, 73, 74, 75, 76, 77, 79, 83, 89, 92, 96, 99, 100, 104, 105, 106, 107, 110, 111, 114, 115, 120, 122, 124, 129, 133, 134, 135, 137, 140, 143, 144, 146, 147, 149, 151, 154, 156, 159, 164, 166, 167, 168, 170, 172, 173, 175, 177, 182, 184, 185, 188, 189, 200, 205, 207, 215, 216, 217, 223, 226, 227, 229, 230, 231, 233, 234, 236, 237, 240, 242, 244, 245, 251, 252, 253, 255, 256, 257, 259, 260, 262, 263, 266, 269, 270, 271, 275, 276, 277, 282, 285, 286, 288, 290, 291, 297, 300, 302, 304, 310, 312, 313, 314, 317, 319, 321, 323, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 336, 338, 342, 346, 348, 351, 354, 356, 359, 361, 362, 363, 365, 366, 367, 369, 371, 372, 376, 378, 379, 380, 382, 383, 384, 385, 387, 389, 390, 391, 396, 397, 398, 402, 405, 407, 408, 409, 410, 414, 416, 418, 419, 426, 428, 429, 430, 432, 434, 436, 438, 439, 444, 445, 446, 447, 448, 450, 452, 453, 454, 458, 459, 462, 463, 465, 474, 476, 479, 483, 484, 485, 487, 489, 492, 493, 496, 498, 499, 501, 503, 504, 505, 509, 510, 511, 513, 516, 519, 522, 524, 526, 529, 530, 533, 535, 537, 538, 541, 542, 544, 547, 548, 549, 551, 552, 554, 555, 556, 557, 560, 564, 568, 569, 570, 572, 574, 576, 580, 581, 585, 586, 587, 588, 592, 599, 601, 604, 605, 606, 607, 608, 611, 613, 614, 616, 621, 623, 626, 627, 628, 629, 633, 635, 636, 639, 641, 642, 643, 644, 647, 648, 649, 651, 652, 653, 654, 655, 656, 659, 660, 661, 662, 663, 665, 671, 672, 674, 677, 680, 682, 683, 686, 688, 690, 692, 695, 698, 699, 700, 701, 702, 704, 705, 706, 708, 709, 710, 711, 712, 713, 714, 716, 718, 721, 722, 725, 726, 727, 730, 731, 737, 740, 741, 742, 750, 755, 756, 758, 759, 760, 761, 765, 766, 768, 769, 770, 775, 779, 782, 783, 788, 789, 791, 793, 794, 796, 800, 801, 807, 808, 810, 813, 814, 815, 818, 820, 823, 824, 825, 827, 828, 831, 832, 834, 836, 837, 839, 841, 842, 844, 845, 847, 848, 849, 852, 853, 854, 855, 856, 857, 858, 859, 860, 862, 863, 864, 865, 866, 867, 870, 872, 873, 884, 887, 888, 891, 894, 897, 901, 902, 903, 904, 908, 909, 910, 911, 912, 914, 915, 917, 919, 921, 922, 925, 926, 927, 928, 931, 932, 934, 935, 936, 938, 940, 941, 942, 943, 946, 947, 952, 954, 956, 957, 958, 960, 964, 966, 970, 971, 972, 973, 975, 976, 977, 978, 980, 981, 982, 983, 985, 988, 991, 992, 994, 996, 997, 1001, 1002, 1003, 1006, 1007, 1012, 1013, 1014, 1015, 1017, 1019, 1021, 1023, 1025, 1026, 1028, 1030, 1032, 1033, 1036, 1037, 1040, 1042, 1046, 1047, 1049, 1050, 1051, 1052, 1056, 1057, 1060, 1063, 1064, 1067, 1068, 1071, 1073, 1074, 1075, 1077, 1079, 1082, 1084, 1086, 1089, 1091, 1092, 1093, 1095, 1099, 1100, 1101, 1102, 1110, 1114, 1117, 1119, 1123, 1124, 1126, 1127, 1128, 1129, 1134, 1135, 1137, 1138, 1140, 1141, 1143, 1145, 1146, 1148, 1149, 1152, 1153, 1155, 1157, 1158, 1159, 1160, 1161, 1166, 1167, 1168, 1169, 1172, 1173, 1175, 1178, 1180, 1181, 1185, 1186, 1187, 1189, 1190, 1192, 1193, 1196, 1197, 1201, 1204, 1205, 1208, 1209, 1211, 1214, 1215, 1217, 1220, 1222, 1223, 1224, 1225, 1229, 1233, 1234, 1237, 1239, 1240, 1243, 1248, 1249, 1250, 1253, 1257, 1258, 1259, 1260, 1261, 1265, 1267, 1269, 1271, 1272, 1273, 1277, 1278, 1280, 1282, 1287, 1293, 1297, 1298, 1301, 1302, 1304, 1307, 1309, 1310, 1311, 1313, 1314, 1317, 1318, 1319, 1321, 1323, 1324, 1328, 1330, 1331, 1335, 1337, 1339, 1345, 1348, 1349, 1351, 1352, 1353, 1354, 1355, 1356, 1357, 1358, 1359, 1362, 1364, 1365, 1366, 1369, 1372, 1376, 1378, 1379, 1380, 1381, 1382, 1383, 1389, 1391, 1392, 1395, 1396, 1398, 1399, 1401, 1404, 1405, 1407, 1408, 1409, 1411, 1412, 1413, 1414, 1422, 1425, 1426, 1428, 1431, 1435, 1438, 1439, 1443, 1444, 1445, 1446, 1447, 1449, 1451, 1452, 1453, 1455, 1456, 1459, 1461, 1462, 1463, 1464, 1465, 1467, 1468, 1472, 1475, 1476, 1478, 1481, 1482, 1484, 1487, 1489, 1491, 1495, 1498, 1499, 1502, 1506, 1509, 1510, 1518, 1519, 1521, 1523, 1524, 1525, 1531, 1534, 1535, 1536, 1540, 1541, 1544, 1547, 1548, 1550, 1551, 1556, 1557, 1559, 1560, 1562, 1566, 1567, 1568, 1569, 1573, 1574, 1577, 1578, 1579, 1583, 1584, 1587, 1588, 1589, 1590, 1591, 1592, 1593, 1594, 1595, 1602, 1605, 1606, 1607, 1608, 1609, 1613, 1615, 1616, 1617, 1618, 1619, 1620, 1621, 1622, 1625, 1627, 1628, 1629, 1632, 1633, 1635, 1636, 1638, 1645, 1646, 1648, 1650, 1651, 1652, 1656, 1657, 1659, 1660, 1665, 1668, 1669, 1672, 1675, 1676, 1678, 1679, 1680, 1681, 1682, 1683, 1684, 1686, 1687, 1690, 1691, 1692, 1694, 1695, 1696, 1698, 1701, 1702, 1703, 1707, 1710, 1712, 1715, 1716, 1717, 1720, 1721, 1722, 1723, 1727, 1729, 1730, 1732, 1734, 1738, 1740, 1741, 1742, 1748, 1749, 1757, 1759, 1760, 1762, 1765, 1766, 1767, 1769, 1775, 1777, 1781, 1785, 1786, 1789, 1792, 1793, 1796, 1797, 1798, 1799, 1800, 1802, 1803, 1804, 1807, 1809, 1811, 1812, 1814, 1816, 1817, 1818, 1819, 1821, 1822, 1823, 1824, 1829, 1830, 1834, 1837, 1840, 1841, 1843, 1849, 1850, 1851, 1852, 1853, 1854, 1855, 1859, 1860, 1862, 1863, 1867, 1868, 1871, 1872, 1873, 1874, 1878, 1881, 1882, 1883, 1884, 1885, 1889, 1890, 1891, 1894, 1896, 1898, 1899, 1907, 1911, 1920, 1922, 1923, 1924, 1925, 1929, 1930, 1932, 1934, 1936, 1938, 1939, 1942, 1943, 1944, 1947, 1948, 1952, 1955, 1957, 1958, 1961, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1971, 1972, 1973, 1975, 1977, 1978, 1979, 1980, 1981, 1986, 1987, 1990, 1991, 1994, 1997, 1999, 2000, 2002, 2004, 2006, 2007, 2008, 2010, 2011, 2016, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2032, 2034, 2036, 2037, 2041, 2044, 2045, 2049, 2057, 2058, 2060, 2062, 2066, 2068, 2071, 2074, 2076, 2079, 2081, 2083, 2084, 2087, 2090, 2093, 2094, 2095, 2097, 2098, 2101, 2102, 2107, 2108, 2109, 2111, 2113, 2115, 2117, 2120, 2121, 2124, 2125, 2127, 2131, 2134, 2135, 2137, 2138, 2139, 2140, 2141, 2145, 2146, 2147, 2153, 2156, 2157, 2158, 2160, 2166, 2170, 2171, 2173, 2174, 2175, 2176, 2179, 2180, 2182, 2183, 2184, 2185, 2186, 2187, 2188, 2189, 2190, 2192, 2193, 2195, 2197, 2198, 2201, 2202, 2208, 2210, 2212, 2214, 2216, 2220, 2221, 2222, 2223, 2224, 2225, 2226, 2230, 2235, 2236, 2241, 2243, 2244, 2245, 2246, 2247, 2248, 2249, 2250, 2251, 2253, 2256, 2258, 2259, 2260, 2264, 2266, 2272, 2273, 2275, 2276, 2280, 2281, 2283, 2285, 2288, 2294, 2295, 2296, 2300, 2303, 2305, 2310, 2311, 2313, 2317, 2318, 2322, 2324, 2325, 2327, 2329, 2330, 2331, 2333, 2334, 2335, 2337, 2339, 2342, 2343, 2347, 2348, 2349, 2350, 2352, 2353, 2354, 2357, 2359, 2360, 2362, 2365, 2369, 2371, 2374, 2377, 2378, 2380, 2381, 2388, 2389, 2390, 2392, 2396, 2397, 2398, 2400, 2401, 2404, 2406, 2407, 2410, 2412, 2414, 2417, 2418, 2420]

@dataclass
class BugTester(AAInstrumentationDriver):
    """
    This class implements the bug tester. The bug tester produces num_runs many
    random AA sequences and uses them to hunt for bugs. In particular, each new
    binary is linked with the initial (precise) binaries and the test is run.
    """

    random_seed: int = 0

    def test_bug(
        self,
        file_name: Path,
        num_candidates: int,
        num_runs: int,
        precise_files: List[Path],
    ):
        random.seed(self.random_seed)

        # generate random sequences
        full_population = self.get_n_random_sequences(num_candidates, num_runs)

        # for each sequence, compile and find distinct binaries
        with Pool(self.proc_count) as pool:
            hashes = pool.starmap(
                self.run_assemble_and_get_hash,
                [
                    (file_name, i, sample, False)
                    for i, sample in enumerate(full_population)
                ],
            )

        hashes = enumerate(hashes)
        distinct_hashes = []
        for i, hash_ in hashes:
            if hash_ not in [h for h, _, _ in distinct_hashes]:
                distinct_hashes.append((hash_, i, full_population[i]))

        computed_hashes = []
        original_output, time_taken = self.run_baseline(computed_hashes=computed_hashes)

        print(f"time taken: {time_taken}")

        # for each distinct binary, link with precise files, run, and compare output
        for ind, (hash_, i, seq) in enumerate(distinct_hashes):
            print(f"Testing sequence {ind + 1}/{len(distinct_hashes)}")
            output, _ = self.link_and_run(
                file_name, i, precise_files, computed_hashes, timeout=time_taken * 10
            )
            print(f"Sequence: {seq}")
            if output is not None and output != original_output:
                print(f"Output: {output}")

        shutil.rmtree(self.exec_root / "binaries")


@dataclass
class SequenceReducer(AAInstrumentationDriver):

    def reduce_sequence(
        self,
        file_name: Path,
        sequence: List[int],
        precise_files: List[Path],
        original_time,
        minimum_difference,
    ):

        self.run_and_assemble_file(file_name, 0, sequence)
        # check if original satisfies the difference
        _, time = self.link_and_run(file_name, 0, precise_files)
        if original_time - time < minimum_difference:
            print("ERROR: original sequence is not fast enough")

        left = 0
        right = len(sequence) - 1
        i = 0
        while left < right:
            i += 1
            mid = (left + right) // 2
            mid_seq = sequence[:mid]
            self.run_and_assemble_file(file_name, 0, mid_seq)
            _, new_time = self.link_and_run(file_name, 0, precise_files)
            print(f"Iteration {i}:")
            print(f"Current sequence: {mid_seq}")
            print(f"Time taken: {new_time}")
            if original_time - new_time < minimum_difference:
                left = mid + 1
            else:
                right = mid

        print(f"Reduced sequence: {sequence[:left]}")


if __name__ == "__main__":
    arg_parser = register_arguments()

    with open("AAInstrumentation/config.txt", "r") as config_file:
        args = arg_parser.parse_args(config_file.read().splitlines() + sys.argv[1:])
    instr_path = args.instr_path
    exec_root = args.exec_root
    specbuild_dir = args.specbuild_dir
    benchmark = args.benchmark
    initial_dir = args.initial_dir
    instr_dir = args.instr_dir
    groundtruth_dir = args.groundtruth_dir

    driver = SequenceReducer(
        instr_path,
        exec_root,
        specbuild_dir,
        benchmark,
        initial_dir,
        instr_dir,
        groundtruth_dir,
        "O3",
        args.proc_count,
    )
    driver.generate_baseline()

    files = driver.get_baseline_files()

    file_name = Path("644/sff.bc")
    precise_files = [f.with_suffix(".o") for f in files if f != file_name]

    for f in files:
       driver.compile_baseline_file(f)


    print(f"Current sequence: {rel_seq_644}")
    hash1 = driver.run_assemble_and_get_hash(file_name, 0, rel_seq_644, remove_files=False)
    print(f"def hash: {hash1}")

    rel_seq_644.pop()
    hash2 = driver.run_assemble_and_get_hash(file_name, 1, rel_seq_644, remove_files=False)
    print(f"def hash without last: {hash2}")

    for i in range(10):
        print(f"Iteration {i}:", flush=True)
        _, new_time = driver.link_and_run(file_name, 0, precise_files)
        print(f"Time taken default: {new_time}")
        
        _, new_time = driver.link_and_run(file_name, 1, precise_files)
        print(f"Time taken without last: {new_time}")

    
    #for i in range(10):
    #   _, time = driver.run_baseline()
    #   print(f"Time taken {i}: {time}")

    #candidates_per_file = driver.get_candidates_per_file(files)
   ## print(candidates_per_file)
   ## for file, num_candidates in candidates_per_file.items():
    #for file in [Path("644/sff.bc")]:
    #   num_candidates = candidates_per_file[file]
    #   print(f"{file}: {num_candidates}")
    #   driver.reduce_sequence(
    #       file, rel_seq_644, [f.with_suffix(".o") for f in files if f != file], 1900, 300
    #   )
