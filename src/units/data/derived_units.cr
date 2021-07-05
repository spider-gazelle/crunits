require "../atom"
require "./base_units"

module Units
  macro register(
    name,
    symbol,
    primary_code,
    secondary_code,
    property,
    scale,
    metric,
    special,
    arbitrary,
    classification
  )
    Atom.new(
      name: {{name}},
      symbol: {{symbol}},
      primary_code: {{primary_code}},
      secondary_code: {{secondary_code}},
      property: {{property}},
      scale: Scale.new(**{{scale}}),
      metric: {{metric}},
      special: {{special}},
      arbitrary: {{arbitrary}},
      classification: {{classification}}
    ).register
  end

  register(
    name: "the number ten for arbitrary powers",
    symbol: "10",
    primary_code: "10*",
    secondary_code: "10*",
    property: "number",
    scale: {
      value: "10",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "the number ten for arbitrary powers",
    symbol: "10",
    primary_code: "10^",
    secondary_code: "10^",
    property: "number",
    scale: {
      value: "10",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "the number pi",
    symbol: "π",
    primary_code: "[pi]",
    secondary_code: "[PI]",
    property: "number",
    scale: {
      value: "3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "percent",
    symbol: "%",
    primary_code: "%",
    secondary_code: "%",
    property: "fraction",
    scale: {
      value: "1",
      unit:  "10*-2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "parts per thousand",
    symbol: "ppth",
    primary_code: "[ppth]",
    secondary_code: "[PPTH]",
    property: "fraction",
    scale: {
      value: "1",
      unit:  "10*-3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "parts per million",
    symbol: "ppm",
    primary_code: "[ppm]",
    secondary_code: "[PPM]",
    property: "fraction",
    scale: {
      value: "1",
      unit:  "10*-6",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "parts per billion",
    symbol: "ppb",
    primary_code: "[ppb]",
    secondary_code: "[PPB]",
    property: "fraction",
    scale: {
      value: "1",
      unit:  "10*-9",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "parts per trillion",
    symbol: "pptr",
    primary_code: "[pptr]",
    secondary_code: "[PPTR]",
    property: "fraction",
    scale: {
      value: "1",
      unit:  "10*-12",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "dimless"
  )

  register(
    name: "mole",
    symbol: "mol",
    primary_code: "mol",
    secondary_code: "MOL",
    property: "amount of substance",
    scale: {
      value: "0.60221367e1",
      unit:  "10*23",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "steradian",
    symbol: "sr",
    primary_code: "sr",
    secondary_code: "SR",
    property: "solid angle",
    scale: {
      value: "1",
      unit:  "rad2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "hertz",
    symbol: "Hz",
    primary_code: "Hz",
    secondary_code: "HZ",
    property: "frequency",
    scale: {
      value: "1",
      unit:  "s-1",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "newton",
    symbol: "N",
    primary_code: "N",
    secondary_code: "N",
    property: "force",
    scale: {
      value: "1",
      unit:  "kg.m/s2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "pascal",
    symbol: "Pa",
    primary_code: "Pa",
    secondary_code: "PAL",
    property: "pressure",
    scale: {
      value: "1",
      unit:  "N/m2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "joule",
    symbol: "J",
    primary_code: "J",
    secondary_code: "J",
    property: "energy",
    scale: {
      value: "1",
      unit:  "N.m",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "watt",
    symbol: "W",
    primary_code: "W",
    secondary_code: "W",
    property: "power",
    scale: {
      value: "1",
      unit:  "J/s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "ampère",
    symbol: "A",
    primary_code: "A",
    secondary_code: "A",
    property: "electric current",
    scale: {
      value: "1",
      unit:  "C/s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "volt",
    symbol: "V",
    primary_code: "V",
    secondary_code: "V",
    property: "electric potential",
    scale: {
      value: "1",
      unit:  "J/C",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "farad",
    symbol: "F",
    primary_code: "F",
    secondary_code: "F",
    property: "electric capacitance",
    scale: {
      value: "1",
      unit:  "C/V",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "ohm",
    symbol: "Ω",
    primary_code: "Ohm",
    secondary_code: "OHM",
    property: "electric resistance",
    scale: {
      value: "1",
      unit:  "V/A",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "siemens",
    symbol: "S",
    primary_code: "S",
    secondary_code: "SIE",
    property: "electric conductance",
    scale: {
      value: "1",
      unit:  "Ohm-1",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "weber",
    symbol: "Wb",
    primary_code: "Wb",
    secondary_code: "WB",
    property: "magentic flux",
    scale: {
      value: "1",
      unit:  "V.s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "degree Celsius",
    symbol: "°C",
    primary_code: "Cel",
    secondary_code: "CEL",
    property: "temperature",
    scale: {
      function_code: "cel",
      value:         "1",
      unit:          "K",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "tesla",
    symbol: "T",
    primary_code: "T",
    secondary_code: "T",
    property: "magnetic flux density",
    scale: {
      value: "1",
      unit:  "Wb/m2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "henry",
    symbol: "H",
    primary_code: "H",
    secondary_code: "H",
    property: "inductance",
    scale: {
      value: "1",
      unit:  "Wb/A",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "lumen",
    symbol: "lm",
    primary_code: "lm",
    secondary_code: "LM",
    property: "luminous flux",
    scale: {
      value: "1",
      unit:  "cd.sr",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "lux",
    symbol: "lx",
    primary_code: "lx",
    secondary_code: "LX",
    property: "illuminance",
    scale: {
      value: "1",
      unit:  "lm/m2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "becquerel",
    symbol: "Bq",
    primary_code: "Bq",
    secondary_code: "BQ",
    property: "radioactivity",
    scale: {
      value: "1",
      unit:  "s-1",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "gray",
    symbol: "Gy",
    primary_code: "Gy",
    secondary_code: "GY",
    property: "energy dose",
    scale: {
      value: "1",
      unit:  "J/kg",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "sievert",
    symbol: "Sv",
    primary_code: "Sv",
    secondary_code: "SV",
    property: "dose equivalent",
    scale: {
      value: "1",
      unit:  "J/kg",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "si"
  )

  register(
    name: "degree",
    symbol: "°",
    primary_code: "deg",
    secondary_code: "DEG",
    property: "plane angle",
    scale: {
      value: "2",
      unit:  "[pi].rad/360",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: ["gon", "grade"],
    symbol: "□<sup>g</sup>",
    primary_code: "gon",
    secondary_code: "GON",
    property: "plane angle",
    scale: {
      value: "0.9e0",
      unit:  "deg",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "minute",
    symbol: "'",
    primary_code: "'",
    secondary_code: "'",
    property: "plane angle",
    scale: {
      value: "1",
      unit:  "deg/60",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "second",
    symbol: "''",
    primary_code: "''",
    secondary_code: "''",
    property: "plane angle",
    scale: {
      value: "1",
      unit:  "'/60",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "liter",
    symbol: "l",
    primary_code: "l",
    secondary_code: "L",
    property: "volume",
    scale: {
      value: "1",
      unit:  "dm3",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "liter",
    symbol: "L",
    primary_code: "L",
    secondary_code: "L",
    property: "volume",
    scale: {
      value: "1",
      unit:  "l",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "are",
    symbol: "a",
    primary_code: "ar",
    secondary_code: "AR",
    property: "area",
    scale: {
      value: "100",
      unit:  "m2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "minute",
    symbol: "min",
    primary_code: "min",
    secondary_code: "MIN",
    property: "time",
    scale: {
      value: "60",
      unit:  "s",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "hour",
    symbol: "h",
    primary_code: "h",
    secondary_code: "HR",
    property: "time",
    scale: {
      value: "60",
      unit:  "min",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "day",
    symbol: "d",
    primary_code: "d",
    secondary_code: "D",
    property: "time",
    scale: {
      value: "24",
      unit:  "h",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "tropical year",
    symbol: "a<sub>t</sub>",
    primary_code: "a_t",
    secondary_code: "ANN_T",
    property: "time",
    scale: {
      value: "0.36524219e3",
      unit:  "d",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "mean Julian year",
    symbol: "a<sub>j</sub>",
    primary_code: "a_j",
    secondary_code: "ANN_J",
    property: "time",
    scale: {
      value: "0.36525e3",
      unit:  "d",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "mean Gregorian year",
    symbol: "a<sub>g</sub>",
    primary_code: "a_g",
    secondary_code: "ANN_G",
    property: "time",
    scale: {
      value: "0.3652425e3",
      unit:  "d",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "year",
    symbol: "a",
    primary_code: "a",
    secondary_code: "ANN",
    property: "time",
    scale: {
      value: "1",
      unit:  "a_j",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "week",
    symbol: "wk",
    primary_code: "wk",
    secondary_code: "WK",
    property: "time",
    scale: {
      value: "7",
      unit:  "d",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "synodal month",
    symbol: "mo<sub>s</sub>",
    primary_code: "mo_s",
    secondary_code: "MO_S",
    property: "time",
    scale: {
      value: "0.2953059e2",
      unit:  "d",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "mean Julian month",
    symbol: "mo<sub>j</sub>",
    primary_code: "mo_j",
    secondary_code: "MO_J",
    property: "time",
    scale: {
      value: "1",
      unit:  "a_j/12",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "mean Gregorian month",
    symbol: "mo<sub>g</sub>",
    primary_code: "mo_g",
    secondary_code: "MO_G",
    property: "time",
    scale: {
      value: "1",
      unit:  "a_g/12",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "month",
    symbol: "mo",
    primary_code: "mo",
    secondary_code: "MO",
    property: "time",
    scale: {
      value: "1",
      unit:  "mo_j",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "tonne",
    symbol: "t",
    primary_code: "t",
    secondary_code: "TNE",
    property: "mass",
    scale: {
      value: "1000",
      unit:  "kg",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "bar",
    symbol: "bar",
    primary_code: "bar",
    secondary_code: "BAR",
    property: "pressure",
    scale: {
      value: "100000",
      unit:  "Pa",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "unified atomic mass unit",
    symbol: "u",
    primary_code: "u",
    secondary_code: "AMU",
    property: "mass",
    scale: {
      value: "0.16605402e-23",
      unit:  "g",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "elementary charge",
    symbol: "<i>e</i>",
    primary_code: "[e]",
    secondary_code: "[E]",
    property: "electric charge",
    scale: {
      value: "0.160217733e-18",
      unit:  "C",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "electronvolt",
    symbol: "eV",
    primary_code: "eV",
    secondary_code: "EV",
    property: "energy",
    scale: {
      value: "1",
      unit:  "[e].V",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "astronomic unit",
    symbol: "AU",
    primary_code: "AU",
    secondary_code: "ASU",
    property: "length",
    scale: {
      value: "0.149597870691e6",
      unit:  "Mm",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "parsec",
    symbol: "pc",
    primary_code: "pc",
    secondary_code: "PRS",
    property: "length",
    scale: {
      value: "30856780000000000",
      unit:  "m",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "iso1000"
  )

  register(
    name: "velocity of light",
    symbol: "<i>c</i>",
    primary_code: "[c]",
    secondary_code: "[C]",
    property: "velocity",
    scale: {
      value: "299792458",
      unit:  "m/s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "Planck constant",
    symbol: "<i>h</i>",
    primary_code: "[h]",
    secondary_code: "[H]",
    property: "action",
    scale: {
      value: "0.66260755e-33",
      unit:  "J.s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "Boltzmann constant",
    symbol: "<i>k</i>",
    primary_code: "[k]",
    secondary_code: "[K]",
    property: "(unclassified)",
    scale: {
      value: "0.1380658e-22",
      unit:  "J/K",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "permittivity of vacuum",
    symbol: "<i>ε<sub><r>0</r></sub></i>",
    primary_code: "[eps_0]",
    secondary_code: "[EPS_0]",
    property: "electric permittivity",
    scale: {
      value: "0.8854187817e-11",
      unit:  "F/m",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "permeability of vacuum",
    symbol: "<i>μ<sub><r>0</r></sub></i>",
    primary_code: "[mu_0]",
    secondary_code: "[MU_0]",
    property: "magnetic permeability",
    scale: {
      value: "1",
      unit:  "4.[pi].10*-7.N/A2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "electron mass",
    symbol: "<i>m<sub><r>e</r></sub></i>",
    primary_code: "[m_e]",
    secondary_code: "[M_E]",
    property: "mass",
    scale: {
      value: "0.91093897e-27",
      unit:  "g",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "proton mass",
    symbol: "<i>m<sub><r>p</r></sub></i>",
    primary_code: "[m_p]",
    secondary_code: "[M_P]",
    property: "mass",
    scale: {
      value: "0.16726231e-23",
      unit:  "g",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "Newtonian constant of gravitation",
    symbol: "<i>G</i>",
    primary_code: "[G]",
    secondary_code: "[GC]",
    property: "(unclassified)",
    scale: {
      value: "0.667259e-10",
      unit:  "m3.kg-1.s-2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "standard acceleration of free fall",
    symbol: "<i>g<sub>n</sub></i>",
    primary_code: "[g]",
    secondary_code: "[G]",
    property: "acceleration",
    scale: {
      value: "0.980665e1",
      unit:  "m/s2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "standard atmosphere",
    symbol: "atm",
    primary_code: "atm",
    secondary_code: "ATM",
    property: "pressure",
    scale: {
      value: "101325",
      unit:  "Pa",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "light-year",
    symbol: "l.y.",
    primary_code: "[ly]",
    secondary_code: "[LY]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[c].a_j",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "gram-force",
    symbol: "gf",
    primary_code: "gf",
    secondary_code: "GF",
    property: "force",
    scale: {
      value: "1",
      unit:  "g.[g]",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "grain",
    symbol: nil,
    primary_code: "[gr]",
    secondary_code: "[GR]",
    property: "mass",
    scale: {
      value: "0.6479891e2",
      unit:  "mg",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: "pound",
    symbol: "lb",
    primary_code: "[lb_av]",
    secondary_code: "[LB_AV]",
    property: "mass",
    scale: {
      value: "7000",
      unit:  "[gr]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: "pound force",
    symbol: "lbf",
    primary_code: "[lbf_av]",
    secondary_code: "[LBF_AV]",
    property: "force",
    scale: {
      value: "1",
      unit:  "[lb_av].[g]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "const"
  )

  register(
    name: "Kayser",
    symbol: "K",
    primary_code: "Ky",
    secondary_code: "KY",
    property: "lineic number",
    scale: {
      value: "1",
      unit:  "cm-1",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Gal",
    symbol: "Gal",
    primary_code: "Gal",
    secondary_code: "GL",
    property: "acceleration",
    scale: {
      value: "1",
      unit:  "cm/s2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "dyne",
    symbol: "dyn",
    primary_code: "dyn",
    secondary_code: "DYN",
    property: "force",
    scale: {
      value: "1",
      unit:  "g.cm/s2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "erg",
    symbol: "erg",
    primary_code: "erg",
    secondary_code: "ERG",
    property: "energy",
    scale: {
      value: "1",
      unit:  "dyn.cm",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Poise",
    symbol: "P",
    primary_code: "P",
    secondary_code: "P",
    property: "dynamic viscosity",
    scale: {
      value: "1",
      unit:  "dyn.s/cm2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Biot",
    symbol: "Bi",
    primary_code: "Bi",
    secondary_code: "BI",
    property: "electric current",
    scale: {
      value: "10",
      unit:  "A",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Stokes",
    symbol: "St",
    primary_code: "St",
    secondary_code: "ST",
    property: "kinematic viscosity",
    scale: {
      value: "1",
      unit:  "cm2/s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Maxwell",
    symbol: "Mx",
    primary_code: "Mx",
    secondary_code: "MX",
    property: "flux of magnetic induction",
    scale: {
      value: "0.1e-7",
      unit:  "Wb",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Gauss",
    symbol: "Gs",
    primary_code: "G",
    secondary_code: "GS",
    property: "magnetic flux density",
    scale: {
      value: "0.1e-3",
      unit:  "T",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Oersted",
    symbol: "Oe",
    primary_code: "Oe",
    secondary_code: "OE",
    property: "magnetic field intensity",
    scale: {
      value: "250",
      unit:  "/[pi].A/m",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Gilbert",
    symbol: "Gb",
    primary_code: "Gb",
    secondary_code: "GB",
    property: "magnetic tension",
    scale: {
      value: "1",
      unit:  "Oe.cm",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "stilb",
    symbol: "sb",
    primary_code: "sb",
    secondary_code: "SB",
    property: "lum. intensity density",
    scale: {
      value: "1",
      unit:  "cd/cm2",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Lambert",
    symbol: "L",
    primary_code: "Lmb",
    secondary_code: "LMB",
    property: "brightness",
    scale: {
      value: "1",
      unit:  "cd/cm2/[pi]",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "phot",
    symbol: "ph",
    primary_code: "ph",
    secondary_code: "PHT",
    property: "illuminance",
    scale: {
      value: "0.1e-3",
      unit:  "lx",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Curie",
    symbol: "Ci",
    primary_code: "Ci",
    secondary_code: "CI",
    property: "radioactivity",
    scale: {
      value: "37000000000",
      unit:  "Bq",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "Roentgen",
    symbol: "R",
    primary_code: "R",
    secondary_code: "ROE",
    property: "ion dose",
    scale: {
      value: "0.258e-3",
      unit:  "C/kg",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "radiation absorbed dose",
    symbol: "RAD",
    primary_code: "RAD",
    secondary_code: "[RAD]",
    property: "energy dose",
    scale: {
      value: "100",
      unit:  "erg/g",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "radiation equivalent man",
    symbol: "REM",
    primary_code: "REM",
    secondary_code: "[REM]",
    property: "dose equivalent",
    scale: {
      value: "1",
      unit:  "RAD",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "cgs"
  )

  register(
    name: "inch",
    symbol: "in",
    primary_code: "[in_i]",
    secondary_code: "[IN_I]",
    property: "length",
    scale: {
      value: "0.254e1",
      unit:  "cm",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "foot",
    symbol: "ft",
    primary_code: "[ft_i]",
    secondary_code: "[FT_I]",
    property: "length",
    scale: {
      value: "12",
      unit:  "[in_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "yard",
    symbol: "yd",
    primary_code: "[yd_i]",
    secondary_code: "[YD_I]",
    property: "length",
    scale: {
      value: "3",
      unit:  "[ft_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "mile",
    symbol: "mi",
    primary_code: "[mi_i]",
    secondary_code: "[MI_I]",
    property: "length",
    scale: {
      value: "5280",
      unit:  "[ft_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "fathom",
    symbol: "fth",
    primary_code: "[fth_i]",
    secondary_code: "[FTH_I]",
    property: "depth of water",
    scale: {
      value: "6",
      unit:  "[ft_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "nautical mile",
    symbol: "n.mi",
    primary_code: "[nmi_i]",
    secondary_code: "[NMI_I]",
    property: "length",
    scale: {
      value: "1852",
      unit:  "m",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "knot",
    symbol: "knot",
    primary_code: "[kn_i]",
    secondary_code: "[KN_I]",
    property: "velocity",
    scale: {
      value: "1",
      unit:  "[nmi_i]/h",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "square inch",
    symbol: nil,
    primary_code: "[sin_i]",
    secondary_code: "[SIN_I]",
    property: "area",
    scale: {
      value: "1",
      unit:  "[in_i]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "square foot",
    symbol: nil,
    primary_code: "[sft_i]",
    secondary_code: "[SFT_I]",
    property: "area",
    scale: {
      value: "1",
      unit:  "[ft_i]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "square yard",
    symbol: nil,
    primary_code: "[syd_i]",
    secondary_code: "[SYD_I]",
    property: "area",
    scale: {
      value: "1",
      unit:  "[yd_i]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "cubic inch",
    symbol: nil,
    primary_code: "[cin_i]",
    secondary_code: "[CIN_I]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[in_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "cubic foot",
    symbol: nil,
    primary_code: "[cft_i]",
    secondary_code: "[CFT_I]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[ft_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "cubic yard",
    symbol: "cu.yd",
    primary_code: "[cyd_i]",
    secondary_code: "[CYD_I]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[yd_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "board foot",
    symbol: nil,
    primary_code: "[bf_i]",
    secondary_code: "[BF_I]",
    property: "volume",
    scale: {
      value: "144",
      unit:  "[in_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "cord",
    symbol: nil,
    primary_code: "[cr_i]",
    secondary_code: "[CR_I]",
    property: "volume",
    scale: {
      value: "128",
      unit:  "[ft_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "mil",
    symbol: "mil",
    primary_code: "[mil_i]",
    secondary_code: "[MIL_I]",
    property: "length",
    scale: {
      value: "0.1e-2",
      unit:  "[in_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "circular mil",
    symbol: "circ.mil",
    primary_code: "[cml_i]",
    secondary_code: "[CML_I]",
    property: "area",
    scale: {
      value: "1",
      unit:  "[pi]/4.[mil_i]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "hand",
    symbol: "hd",
    primary_code: "[hd_i]",
    secondary_code: "[HD_I]",
    property: "height of horses",
    scale: {
      value: "4",
      unit:  "[in_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "intcust"
  )

  register(
    name: "foot",
    symbol: "ft<sub>us</sub>",
    primary_code: "[ft_us]",
    secondary_code: "[FT_US]",
    property: "length",
    scale: {
      value: "1200",
      unit:  "m/3937",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "yard",
    symbol: nil,
    primary_code: "[yd_us]",
    secondary_code: "[YD_US]",
    property: "length",
    scale: {
      value: "3",
      unit:  "[ft_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "inch",
    symbol: nil,
    primary_code: "[in_us]",
    secondary_code: "[IN_US]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[ft_us]/12",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "rod",
    symbol: nil,
    primary_code: "[rd_us]",
    secondary_code: "[RD_US]",
    property: "length",
    scale: {
      value: "0.165e2",
      unit:  "[ft_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: ["Gunter's chain", "Surveyor's chain"],
    symbol: nil,
    primary_code: "[ch_us]",
    secondary_code: "[CH_US]",
    property: "length",
    scale: {
      value: "4",
      unit:  "[rd_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "link for Gunter's chain",
    symbol: nil,
    primary_code: "[lk_us]",
    secondary_code: "[LK_US]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[ch_us]/100",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: ["Ramden's chain", "Engineer's chain"],
    symbol: nil,
    primary_code: "[rch_us]",
    secondary_code: "[RCH_US]",
    property: "length",
    scale: {
      value: "100",
      unit:  "[ft_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "link for Ramden's chain",
    symbol: nil,
    primary_code: "[rlk_us]",
    secondary_code: "[RLK_US]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[rch_us]/100",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "fathom",
    symbol: nil,
    primary_code: "[fth_us]",
    secondary_code: "[FTH_US]",
    property: "length",
    scale: {
      value: "6",
      unit:  "[ft_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "furlong",
    symbol: nil,
    primary_code: "[fur_us]",
    secondary_code: "[FUR_US]",
    property: "length",
    scale: {
      value: "40",
      unit:  "[rd_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "mile",
    symbol: nil,
    primary_code: "[mi_us]",
    secondary_code: "[MI_US]",
    property: "length",
    scale: {
      value: "8",
      unit:  "[fur_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "acre",
    symbol: nil,
    primary_code: "[acr_us]",
    secondary_code: "[ACR_US]",
    property: "area",
    scale: {
      value: "160",
      unit:  "[rd_us]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "square rod",
    symbol: nil,
    primary_code: "[srd_us]",
    secondary_code: "[SRD_US]",
    property: "area",
    scale: {
      value: "1",
      unit:  "[rd_us]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "square mile",
    symbol: nil,
    primary_code: "[smi_us]",
    secondary_code: "[SMI_US]",
    property: "area",
    scale: {
      value: "1",
      unit:  "[mi_us]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "section",
    symbol: nil,
    primary_code: "[sct]",
    secondary_code: "[SCT]",
    property: "area",
    scale: {
      value: "1",
      unit:  "[mi_us]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "township",
    symbol: nil,
    primary_code: "[twp]",
    secondary_code: "[TWP]",
    property: "area",
    scale: {
      value: "36",
      unit:  "[sct]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "mil",
    symbol: nil,
    primary_code: "[mil_us]",
    secondary_code: "[MIL_US]",
    property: "length",
    scale: {
      value: "0.1e-2",
      unit:  "[in_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-lengths"
  )

  register(
    name: "inch",
    symbol: nil,
    primary_code: "[in_br]",
    secondary_code: "[IN_BR]",
    property: "length",
    scale: {
      value: "0.2539998e1",
      unit:  "cm",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "foot",
    symbol: nil,
    primary_code: "[ft_br]",
    secondary_code: "[FT_BR]",
    property: "length",
    scale: {
      value: "12",
      unit:  "[in_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "rod",
    symbol: nil,
    primary_code: "[rd_br]",
    secondary_code: "[RD_BR]",
    property: "length",
    scale: {
      value: "0.165e2",
      unit:  "[ft_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "Gunter's chain",
    symbol: nil,
    primary_code: "[ch_br]",
    secondary_code: "[CH_BR]",
    property: "length",
    scale: {
      value: "4",
      unit:  "[rd_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "link for Gunter's chain",
    symbol: nil,
    primary_code: "[lk_br]",
    secondary_code: "[LK_BR]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[ch_br]/100",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "fathom",
    symbol: nil,
    primary_code: "[fth_br]",
    secondary_code: "[FTH_BR]",
    property: "length",
    scale: {
      value: "6",
      unit:  "[ft_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "pace",
    symbol: nil,
    primary_code: "[pc_br]",
    secondary_code: "[PC_BR]",
    property: "length",
    scale: {
      value: "0.25e1",
      unit:  "[ft_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "yard",
    symbol: nil,
    primary_code: "[yd_br]",
    secondary_code: "[YD_BR]",
    property: "length",
    scale: {
      value: "3",
      unit:  "[ft_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "mile",
    symbol: nil,
    primary_code: "[mi_br]",
    secondary_code: "[MI_BR]",
    property: "length",
    scale: {
      value: "5280",
      unit:  "[ft_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "nautical mile",
    symbol: nil,
    primary_code: "[nmi_br]",
    secondary_code: "[NMI_BR]",
    property: "length",
    scale: {
      value: "6080",
      unit:  "[ft_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "knot",
    symbol: nil,
    primary_code: "[kn_br]",
    secondary_code: "[KN_BR]",
    property: "velocity",
    scale: {
      value: "1",
      unit:  "[nmi_br]/h",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "acre",
    symbol: nil,
    primary_code: "[acr_br]",
    secondary_code: "[ACR_BR]",
    property: "area",
    scale: {
      value: "4840",
      unit:  "[yd_br]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-length"
  )

  register(
    name: "Queen Anne's wine gallon",
    symbol: nil,
    primary_code: "[gal_us]",
    secondary_code: "[GAL_US]",
    property: "fluid volume",
    scale: {
      value: "231",
      unit:  "[in_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "barrel",
    symbol: nil,
    primary_code: "[bbl_us]",
    secondary_code: "[BBL_US]",
    property: "fluid volume",
    scale: {
      value: "42",
      unit:  "[gal_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "quart",
    symbol: nil,
    primary_code: "[qt_us]",
    secondary_code: "[QT_US]",
    property: "fluid volume",
    scale: {
      value: "1",
      unit:  "[gal_us]/4",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "pint",
    symbol: nil,
    primary_code: "[pt_us]",
    secondary_code: "[PT_US]",
    property: "fluid volume",
    scale: {
      value: "1",
      unit:  "[qt_us]/2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "gill",
    symbol: nil,
    primary_code: "[gil_us]",
    secondary_code: "[GIL_US]",
    property: "fluid volume",
    scale: {
      value: "1",
      unit:  "[pt_us]/4",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "fluid ounce",
    symbol: "oz fl",
    primary_code: "[foz_us]",
    secondary_code: "[FOZ_US]",
    property: "fluid volume",
    scale: {
      value: "1",
      unit:  "[gil_us]/4",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "fluid dram",
    symbol: nil,
    primary_code: "[fdr_us]",
    secondary_code: "[FDR_US]",
    property: "fluid volume",
    scale: {
      value: "1",
      unit:  "[foz_us]/8",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "minim",
    symbol: nil,
    primary_code: "[min_us]",
    secondary_code: "[MIN_US]",
    property: "fluid volume",
    scale: {
      value: "1",
      unit:  "[fdr_us]/60",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "cord",
    symbol: nil,
    primary_code: "[crd_us]",
    secondary_code: "[CRD_US]",
    property: "fluid volume",
    scale: {
      value: "128",
      unit:  "[ft_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "bushel",
    symbol: nil,
    primary_code: "[bu_us]",
    secondary_code: "[BU_US]",
    property: "dry volume",
    scale: {
      value: "0.215042e4",
      unit:  "[in_i]3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "historical winchester gallon",
    symbol: nil,
    primary_code: "[gal_wi]",
    secondary_code: "[GAL_WI]",
    property: "dry volume",
    scale: {
      value: "1",
      unit:  "[bu_us]/8",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "peck",
    symbol: nil,
    primary_code: "[pk_us]",
    secondary_code: "[PK_US]",
    property: "dry volume",
    scale: {
      value: "1",
      unit:  "[bu_us]/4",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "dry quart",
    symbol: nil,
    primary_code: "[dqt_us]",
    secondary_code: "[DQT_US]",
    property: "dry volume",
    scale: {
      value: "1",
      unit:  "[pk_us]/8",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "dry pint",
    symbol: nil,
    primary_code: "[dpt_us]",
    secondary_code: "[DPT_US]",
    property: "dry volume",
    scale: {
      value: "1",
      unit:  "[dqt_us]/2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "tablespoon",
    symbol: nil,
    primary_code: "[tbs_us]",
    secondary_code: "[TBS_US]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[foz_us]/2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "teaspoon",
    symbol: nil,
    primary_code: "[tsp_us]",
    secondary_code: "[TSP_US]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[tbs_us]/3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "cup",
    symbol: nil,
    primary_code: "[cup_us]",
    secondary_code: "[CUP_US]",
    property: "volume",
    scale: {
      value: "16",
      unit:  "[tbs_us]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "metric fluid ounce",
    symbol: "oz fl",
    primary_code: "[foz_m]",
    secondary_code: "[FOZ_M]",
    property: "fluid volume",
    scale: {
      value: "30",
      unit:  "mL",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "metric cup",
    symbol: nil,
    primary_code: "[cup_m]",
    secondary_code: "[CUP_M]",
    property: "volume",
    scale: {
      value: "240",
      unit:  "mL",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "metric teaspoon",
    symbol: nil,
    primary_code: "[tsp_m]",
    secondary_code: "[TSP_M]",
    property: "volume",
    scale: {
      value: "5",
      unit:  "mL",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "metric tablespoon",
    symbol: nil,
    primary_code: "[tbs_m]",
    secondary_code: "[TBS_M]",
    property: "volume",
    scale: {
      value: "15",
      unit:  "mL",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "us-volumes"
  )

  register(
    name: "gallon",
    symbol: nil,
    primary_code: "[gal_br]",
    secondary_code: "[GAL_BR]",
    property: "volume",
    scale: {
      value: "0.454609e1",
      unit:  "l",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "peck",
    symbol: nil,
    primary_code: "[pk_br]",
    secondary_code: "[PK_BR]",
    property: "volume",
    scale: {
      value: "2",
      unit:  "[gal_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "bushel",
    symbol: nil,
    primary_code: "[bu_br]",
    secondary_code: "[BU_BR]",
    property: "volume",
    scale: {
      value: "4",
      unit:  "[pk_br]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "quart",
    symbol: nil,
    primary_code: "[qt_br]",
    secondary_code: "[QT_BR]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[gal_br]/4",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "pint",
    symbol: nil,
    primary_code: "[pt_br]",
    secondary_code: "[PT_BR]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[qt_br]/2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "gill",
    symbol: nil,
    primary_code: "[gil_br]",
    secondary_code: "[GIL_BR]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[pt_br]/4",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "fluid ounce",
    symbol: nil,
    primary_code: "[foz_br]",
    secondary_code: "[FOZ_BR]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[gil_br]/5",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "fluid dram",
    symbol: nil,
    primary_code: "[fdr_br]",
    secondary_code: "[FDR_BR]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[foz_br]/8",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "minim",
    symbol: nil,
    primary_code: "[min_br]",
    secondary_code: "[MIN_BR]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "[fdr_br]/60",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "brit-volumes"
  )

  register(
    name: "ounce",
    symbol: "oz",
    primary_code: "[oz_av]",
    secondary_code: "[OZ_AV]",
    property: "mass",
    scale: {
      value: "1",
      unit:  "[lb_av]/16",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: "dram",
    symbol: nil,
    primary_code: "[dr_av]",
    secondary_code: "[DR_AV]",
    property: "mass",
    scale: {
      value: "1",
      unit:  "[oz_av]/16",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: ["short hundredweight", "U.S. hundredweight"],
    symbol: nil,
    primary_code: "[scwt_av]",
    secondary_code: "[SCWT_AV]",
    property: "mass",
    scale: {
      value: "100",
      unit:  "[lb_av]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: ["long hunderdweight", "British hundredweight"],
    symbol: nil,
    primary_code: "[lcwt_av]",
    secondary_code: "[LCWT_AV]",
    property: "mass",
    scale: {
      value: "112",
      unit:  "[lb_av]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: ["short ton", "U.S. ton"],
    symbol: nil,
    primary_code: "[ston_av]",
    secondary_code: "[STON_AV]",
    property: "mass",
    scale: {
      value: "20",
      unit:  "[scwt_av]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: ["long ton", "British ton"],
    symbol: nil,
    primary_code: "[lton_av]",
    secondary_code: "[LTON_AV]",
    property: "mass",
    scale: {
      value: "20",
      unit:  "[lcwt_av]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: ["stone", "British stone"],
    symbol: nil,
    primary_code: "[stone_av]",
    secondary_code: "[STONE_AV]",
    property: "mass",
    scale: {
      value: "14",
      unit:  "[lb_av]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "avoirdupois"
  )

  register(
    name: "pennyweight",
    symbol: nil,
    primary_code: "[pwt_tr]",
    secondary_code: "[PWT_TR]",
    property: "mass",
    scale: {
      value: "24",
      unit:  "[gr]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "troy"
  )

  register(
    name: "ounce",
    symbol: nil,
    primary_code: "[oz_tr]",
    secondary_code: "[OZ_TR]",
    property: "mass",
    scale: {
      value: "20",
      unit:  "[pwt_tr]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "troy"
  )

  register(
    name: "pound",
    symbol: nil,
    primary_code: "[lb_tr]",
    secondary_code: "[LB_TR]",
    property: "mass",
    scale: {
      value: "12",
      unit:  "[oz_tr]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "troy"
  )

  register(
    name: "scruple",
    symbol: nil,
    primary_code: "[sc_ap]",
    secondary_code: "[SC_AP]",
    property: "mass",
    scale: {
      value: "20",
      unit:  "[gr]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "apoth"
  )

  register(
    name: ["dram", "drachm"],
    symbol: nil,
    primary_code: "[dr_ap]",
    secondary_code: "[DR_AP]",
    property: "mass",
    scale: {
      value: "3",
      unit:  "[sc_ap]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "apoth"
  )

  register(
    name: "ounce",
    symbol: nil,
    primary_code: "[oz_ap]",
    secondary_code: "[OZ_AP]",
    property: "mass",
    scale: {
      value: "8",
      unit:  "[dr_ap]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "apoth"
  )

  register(
    name: "pound",
    symbol: nil,
    primary_code: "[lb_ap]",
    secondary_code: "[LB_AP]",
    property: "mass",
    scale: {
      value: "12",
      unit:  "[oz_ap]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "apoth"
  )

  register(
    name: "metric ounce",
    symbol: nil,
    primary_code: "[oz_m]",
    secondary_code: "[OZ_M]",
    property: "mass",
    scale: {
      value: "28",
      unit:  "g",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "apoth"
  )

  register(
    name: "line",
    symbol: nil,
    primary_code: "[lne]",
    secondary_code: "[LNE]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[in_i]/12",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: "point",
    symbol: nil,
    primary_code: "[pnt]",
    secondary_code: "[PNT]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[lne]/6",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: "pica",
    symbol: nil,
    primary_code: "[pca]",
    secondary_code: "[PCA]",
    property: "length",
    scale: {
      value: "12",
      unit:  "[pnt]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: "Printer's point",
    symbol: nil,
    primary_code: "[pnt_pr]",
    secondary_code: "[PNT_PR]",
    property: "length",
    scale: {
      value: "0.13837e-1",
      unit:  "[in_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: "Printer's pica",
    symbol: nil,
    primary_code: "[pca_pr]",
    secondary_code: "[PCA_PR]",
    property: "length",
    scale: {
      value: "12",
      unit:  "[pnt_pr]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: ["pied", "French foot"],
    symbol: nil,
    primary_code: "[pied]",
    secondary_code: "[PIED]",
    property: "length",
    scale: {
      value: "0.3248e2",
      unit:  "cm",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: ["pouce", "French inch"],
    symbol: nil,
    primary_code: "[pouce]",
    secondary_code: "[POUCE]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[pied]/12",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: ["ligne", "French line"],
    symbol: nil,
    primary_code: "[ligne]",
    secondary_code: "[LIGNE]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[pouce]/12",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: ["didot", "Didot's point"],
    symbol: nil,
    primary_code: "[didot]",
    secondary_code: "[DIDOT]",
    property: "length",
    scale: {
      value: "1",
      unit:  "[ligne]/6",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: ["cicero", "Didot's pica"],
    symbol: nil,
    primary_code: "[cicero]",
    secondary_code: "[CICERO]",
    property: "length",
    scale: {
      value: "12",
      unit:  "[didot]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "typeset"
  )

  register(
    name: "degree Fahrenheit",
    symbol: "°F",
    primary_code: "[degF]",
    secondary_code: "[DEGF]",
    property: "temperature",
    scale: {
      function_code: "degf",
      value:         "5",
      unit:          "K/9",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "degree Rankine",
    symbol: "°R",
    primary_code: "[degR]",
    secondary_code: "[degR]",
    property: "temperature",
    scale: {
      value: "5",
      unit:  "K/9",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "degree Réaumur",
    symbol: "°Ré",
    primary_code: "[degRe]",
    secondary_code: "[degRe]",
    property: "temperature",
    scale: {
      function_code: "degre",
      value:         "5",
      unit:          "K/4",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "calorie at 15 °C",
    symbol: "cal<sub>15°C</sub>",
    primary_code: "cal_[15]",
    secondary_code: "CAL_[15]",
    property: "energy",
    scale: {
      value: "0.41858e1",
      unit:  "J",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "calorie at 20 °C",
    symbol: "cal<sub>20°C</sub>",
    primary_code: "cal_[20]",
    secondary_code: "CAL_[20]",
    property: "energy",
    scale: {
      value: "0.41819e1",
      unit:  "J",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "mean calorie",
    symbol: "cal<sub>m</sub>",
    primary_code: "cal_m",
    secondary_code: "CAL_M",
    property: "energy",
    scale: {
      value: "0.419002e1",
      unit:  "J",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "international table calorie",
    symbol: "cal<sub>IT</sub>",
    primary_code: "cal_IT",
    secondary_code: "CAL_IT",
    property: "energy",
    scale: {
      value: "0.41868e1",
      unit:  "J",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "thermochemical calorie",
    symbol: "cal<sub>th</sub>",
    primary_code: "cal_th",
    secondary_code: "CAL_TH",
    property: "energy",
    scale: {
      value: "0.4184e1",
      unit:  "J",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "calorie",
    symbol: "cal",
    primary_code: "cal",
    secondary_code: "CAL",
    property: "energy",
    scale: {
      value: "1",
      unit:  "cal_th",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "nutrition label Calories",
    symbol: "Cal",
    primary_code: "[Cal]",
    secondary_code: "[CAL]",
    property: "energy",
    scale: {
      value: "1",
      unit:  "kcal_th",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "British thermal unit at 39 °F",
    symbol: "Btu<sub>39°F</sub>",
    primary_code: "[Btu_39]",
    secondary_code: "[BTU_39]",
    property: "energy",
    scale: {
      value: "0.105967e1",
      unit:  "kJ",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "British thermal unit at 59 °F",
    symbol: "Btu<sub>59°F</sub>",
    primary_code: "[Btu_59]",
    secondary_code: "[BTU_59]",
    property: "energy",
    scale: {
      value: "0.10548e1",
      unit:  "kJ",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "British thermal unit at 60 °F",
    symbol: "Btu<sub>60°F</sub>",
    primary_code: "[Btu_60]",
    secondary_code: "[BTU_60]",
    property: "energy",
    scale: {
      value: "0.105468e1",
      unit:  "kJ",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "mean British thermal unit",
    symbol: "Btu<sub>m</sub>",
    primary_code: "[Btu_m]",
    secondary_code: "[BTU_M]",
    property: "energy",
    scale: {
      value: "0.105587e1",
      unit:  "kJ",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "international table British thermal unit",
    symbol: "Btu<sub>IT</sub>",
    primary_code: "[Btu_IT]",
    secondary_code: "[BTU_IT]",
    property: "energy",
    scale: {
      value: "0.105505585262e1",
      unit:  "kJ",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "thermochemical British thermal unit",
    symbol: "Btu<sub>th</sub>",
    primary_code: "[Btu_th]",
    secondary_code: "[BTU_TH]",
    property: "energy",
    scale: {
      value: "0.105435e1",
      unit:  "kJ",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "British thermal unit",
    symbol: "btu",
    primary_code: "[Btu]",
    secondary_code: "[BTU]",
    property: "energy",
    scale: {
      value: "1",
      unit:  "[Btu_th]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "horsepower",
    symbol: nil,
    primary_code: "[HP]",
    secondary_code: "[HP]",
    property: "power",
    scale: {
      value: "550",
      unit:  "[ft_i].[lbf_av]/s",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "tex",
    symbol: "tex",
    primary_code: "tex",
    secondary_code: "TEX",
    property: "linear mass density (of textile thread)",
    scale: {
      value: "1",
      unit:  "g/km",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "Denier",
    symbol: "den",
    primary_code: "[den]",
    secondary_code: "[DEN]",
    property: "linear mass density (of textile thread)",
    scale: {
      value: "1",
      unit:  "g/9/km",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "heat"
  )

  register(
    name: "meter of water column",
    symbol: "m H<sub><r>2</r></sub>O",
    primary_code: "m[H2O]",
    secondary_code: "M[H2O]",
    property: "pressure",
    scale: {
      value: "0.980665e1",
      unit:  "kPa",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "meter of mercury column",
    symbol: "m Hg",
    primary_code: "m[Hg]",
    secondary_code: "M[HG]",
    property: "pressure",
    scale: {
      value: "0.133322e3",
      unit:  "kPa",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "inch of water column",
    symbol: "in H<sub><r>2</r></sub>O",
    primary_code: "[in_i'H2O]",
    secondary_code: "[IN_I'H2O]",
    property: "pressure",
    scale: {
      value: "1",
      unit:  "m[H2O].[in_i]/m",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "inch of mercury column",
    symbol: "in Hg",
    primary_code: "[in_i'Hg]",
    secondary_code: "[IN_I'HG]",
    property: "pressure",
    scale: {
      value: "1",
      unit:  "m[Hg].[in_i]/m",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "peripheral vascular resistance unit",
    symbol: "P.R.U.",
    primary_code: "[PRU]",
    secondary_code: "[PRU]",
    property: "fluid resistance",
    scale: {
      value: "1",
      unit:  "mm[Hg].s/ml",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "Wood unit",
    symbol: "Wood U.",
    primary_code: "[wood'U]",
    secondary_code: "[WOOD'U]",
    property: "fluid resistance",
    scale: {
      value: "1",
      unit:  "mm[Hg].min/L",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "diopter",
    symbol: "dpt",
    primary_code: "[diop]",
    secondary_code: "[DIOP]",
    property: "refraction of a lens",
    scale: {
      value: "1",
      unit:  "/m",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "prism diopter",
    symbol: "PD",
    primary_code: "[p'diop]",
    secondary_code: "[P'DIOP]",
    property: "refraction of a prism",
    scale: {
      function_code: "tan100",
      value:         "1",
      unit:          "deg",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "percent of slope",
    symbol: "%",
    primary_code: "%[slope]",
    secondary_code: "%[SLOPE]",
    property: "slope",
    scale: {
      function_code: "tan100",
      value:         "1",
      unit:          "deg",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "mesh",
    symbol: nil,
    primary_code: "[mesh_i]",
    secondary_code: "[MESH_I]",
    property: "lineic number",
    scale: {
      value: "1",
      unit:  "/[in_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: ["Charrière", "french"],
    symbol: "Ch",
    primary_code: "[Ch]",
    secondary_code: "[CH]",
    property: "gauge of catheters",
    scale: {
      value: "1",
      unit:  "mm/3",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "drop",
    symbol: "drp",
    primary_code: "[drp]",
    secondary_code: "[DRP]",
    property: "volume",
    scale: {
      value: "1",
      unit:  "ml/20",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "Hounsfield unit",
    symbol: "HF",
    primary_code: "[hnsf'U]",
    secondary_code: "[HNSF'U]",
    property: "x-ray attenuation",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "metabolic equivalent",
    symbol: "MET",
    primary_code: "[MET]",
    secondary_code: "[MET]",
    property: "metabolic cost of physical activity",
    scale: {
      value: "0.35e1",
      unit:  "mL/min/kg",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of decimal series (retired)",
    symbol: "X",
    primary_code: "[hp'_X]",
    secondary_code: "[HP'_X]",
    property: "homeopathic potency (retired)",
    scale: {
      function_code: "hpx",
      value:         "1",
      unit:          "1",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of centesimal series (retired)",
    symbol: "C",
    primary_code: "[hp'_C]",
    secondary_code: "[HP'_C]",
    property: "homeopathic potency (retired)",
    scale: {
      function_code: "hpc",
      value:         "1",
      unit:          "1",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of decimal hahnemannian series",
    symbol: "X",
    primary_code: "[hp_X]",
    secondary_code: "[HP_X]",
    property: "homeopathic potency (Hahnemann)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of centesimal hahnemannian series",
    symbol: "C",
    primary_code: "[hp_C]",
    secondary_code: "[HP_C]",
    property: "homeopathic potency (Hahnemann)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of millesimal hahnemannian series",
    symbol: "M",
    primary_code: "[hp_M]",
    secondary_code: "[HP_M]",
    property: "homeopathic potency (Hahnemann)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of quintamillesimal hahnemannian series",
    symbol: "Q",
    primary_code: "[hp_Q]",
    secondary_code: "[HP_Q]",
    property: "homeopathic potency (Hahnemann)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of decimal korsakovian series",
    symbol: "X",
    primary_code: "[kp_X]",
    secondary_code: "[KP_X]",
    property: "homeopathic potency (Korsakov)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of centesimal korsakovian series",
    symbol: "C",
    primary_code: "[kp_C]",
    secondary_code: "[KP_C]",
    property: "homeopathic potency (Korsakov)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of millesimal korsakovian series",
    symbol: "M",
    primary_code: "[kp_M]",
    secondary_code: "[KP_M]",
    property: "homeopathic potency (Korsakov)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "homeopathic potency of quintamillesimal korsakovian series",
    symbol: "Q",
    primary_code: "[kp_Q]",
    secondary_code: "[KP_Q]",
    property: "homeopathic potency (Korsakov)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "clinical"
  )

  register(
    name: "equivalents",
    symbol: "eq",
    primary_code: "eq",
    secondary_code: "EQ",
    property: "amount of substance",
    scale: {
      value: "1",
      unit:  "mol",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "osmole",
    symbol: "osm",
    primary_code: "osm",
    secondary_code: "OSM",
    property: "amount of substance (dissolved particles)",
    scale: {
      value: "1",
      unit:  "mol",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "pH",
    symbol: "pH",
    primary_code: "[pH]",
    secondary_code: "[PH]",
    property: "acidity",
    scale: {
      function_code: "ph",
      value:         "1",
      unit:          "mol/l",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "gram percent",
    symbol: "g%",
    primary_code: "g%",
    secondary_code: "G%",
    property: "mass concentration",
    scale: {
      value: "1",
      unit:  "g/dl",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "Svedberg unit",
    symbol: "S",
    primary_code: "[S]",
    secondary_code: "[S]",
    property: "sedimentation coefficient",
    scale: {
      value: "1",
      unit:  "10*-13.s",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "high power field",
    symbol: "HPF",
    primary_code: "[HPF]",
    secondary_code: "[HPF]",
    property: "view area in microscope",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "low power field",
    symbol: "LPF",
    primary_code: "[LPF]",
    secondary_code: "[LPF]",
    property: "view area in microscope",
    scale: {
      value: "100",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "katal",
    symbol: "kat",
    primary_code: "kat",
    secondary_code: "KAT",
    property: "catalytic activity",
    scale: {
      value: "1",
      unit:  "mol/s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "Unit",
    symbol: "U",
    primary_code: "U",
    secondary_code: "U",
    property: "catalytic activity",
    scale: {
      value: "1",
      unit:  "mol/min",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "chemical"
  )

  register(
    name: "international unit",
    symbol: "IU",
    primary_code: "[iU]",
    secondary_code: "[IU]",
    property: "arbitrary",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: true,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "international unit",
    symbol: "i.U.",
    primary_code: "[IU]",
    secondary_code: "[IU]",
    property: "arbitrary",
    scale: {
      value: "1",
      unit:  "[iU]",
    },
    metric: true,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "arbitary unit",
    symbol: "arb. U",
    primary_code: "[arb'U]",
    secondary_code: "[ARB'U]",
    property: "arbitrary",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "United States Pharmacopeia unit",
    symbol: "U.S.P.",
    primary_code: "[USP'U]",
    secondary_code: "[USP'U]",
    property: "arbitrary",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "GPL unit",
    symbol: nil,
    primary_code: "[GPL'U]",
    secondary_code: "[GPL'U]",
    property: "biologic activity of anticardiolipin IgG",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "MPL unit",
    symbol: nil,
    primary_code: "[MPL'U]",
    secondary_code: "[MPL'U]",
    property: "biologic activity of anticardiolipin IgM",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "APL unit",
    symbol: nil,
    primary_code: "[APL'U]",
    secondary_code: "[APL'U]",
    property: "biologic activity of anticardiolipin IgA",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Bethesda unit",
    symbol: nil,
    primary_code: "[beth'U]",
    secondary_code: "[BETH'U]",
    property: "biologic activity of factor VIII inhibitor",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "anti factor Xa unit",
    symbol: nil,
    primary_code: "[anti'Xa'U]",
    secondary_code: "[ANTI'XA'U]",
    property: "biologic activity of factor Xa inhibitor (heparin)",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Todd unit",
    symbol: nil,
    primary_code: "[todd'U]",
    secondary_code: "[TODD'U]",
    property: "biologic activity antistreptolysin O",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Dye unit",
    symbol: nil,
    primary_code: "[dye'U]",
    secondary_code: "[DYE'U]",
    property: "biologic activity of amylase",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Somogyi unit",
    symbol: nil,
    primary_code: "[smgy'U]",
    secondary_code: "[SMGY'U]",
    property: "biologic activity of amylase",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Bodansky unit",
    symbol: nil,
    primary_code: "[bdsk'U]",
    secondary_code: "[BDSK'U]",
    property: "biologic activity of phosphatase",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "King-Armstrong unit",
    symbol: nil,
    primary_code: "[ka'U]",
    secondary_code: "[KA'U]",
    property: "biologic activity of phosphatase",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Kunkel unit",
    symbol: nil,
    primary_code: "[knk'U]",
    secondary_code: "[KNK'U]",
    property: "arbitrary biologic activity",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Mac Lagan unit",
    symbol: nil,
    primary_code: "[mclg'U]",
    secondary_code: "[MCLG'U]",
    property: "arbitrary biologic activity",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "tuberculin unit",
    symbol: nil,
    primary_code: "[tb'U]",
    secondary_code: "[TB'U]",
    property: "biologic activity of tuberculin",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "50% cell culture infectious dose",
    symbol: "CCID<sub>50</sub>",
    primary_code: "[CCID_50]",
    secondary_code: "[CCID_50]",
    property: "biologic activity (infectivity) of an infectious agent preparation",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "50% tissue culture infectious dose",
    symbol: "TCID<sub>50</sub>",
    primary_code: "[TCID_50]",
    secondary_code: "[TCID_50]",
    property: "biologic activity (infectivity) of an infectious agent preparation",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "50% embryo infectious dose",
    symbol: "EID<sub>50</sub>",
    primary_code: "[EID_50]",
    secondary_code: "[EID_50]",
    property: "biologic activity (infectivity) of an infectious agent preparation",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "plaque forming units",
    symbol: "PFU",
    primary_code: "[PFU]",
    secondary_code: "[PFU]",
    property: "amount of an infectious agent",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "focus forming units",
    symbol: "FFU",
    primary_code: "[FFU]",
    secondary_code: "[FFU]",
    property: "amount of an infectious agent",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "colony forming units",
    symbol: "CFU",
    primary_code: "[CFU]",
    secondary_code: "[CFU]",
    property: "amount of a proliferating organism",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "index of reactivity",
    symbol: "IR",
    primary_code: "[IR]",
    secondary_code: "[IR]",
    property: "amount of an allergen callibrated through in-vivo testing using the Stallergenes® method.",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "bioequivalent allergen unit",
    symbol: "BAU",
    primary_code: "[BAU]",
    secondary_code: "[BAU]",
    property: "amount of an allergen callibrated through in-vivo testing based on the ID50EAL method of (intradermal dilution for 50mm sum of erythema diameters",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "allergen unit",
    symbol: "AU",
    primary_code: "[AU]",
    secondary_code: "[AU]",
    property: "procedure defined amount of an allergen using some reference standard",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "allergen unit for Ambrosia artemisiifolia",
    symbol: "Amb a 1 U",
    primary_code: "[Amb'a'1'U]",
    secondary_code: "[AMB'A'1'U]",
    property: "procedure defined amount of the major allergen of ragweed.",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "protein nitrogen unit",
    symbol: "PNU",
    primary_code: "[PNU]",
    secondary_code: "[PNU]",
    property: "procedure defined amount of a protein substance",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Limit of flocculation",
    symbol: "Lf",
    primary_code: "[Lf]",
    secondary_code: "[LF]",
    property: "procedure defined amount of an antigen substance",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "D-antigen unit",
    symbol: nil,
    primary_code: "[D'ag'U]",
    secondary_code: "[D'AG'U]",
    property: "procedure defined amount of a poliomyelitis d-antigen substance",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "fibrinogen equivalent unit",
    symbol: nil,
    primary_code: "[FEU]",
    secondary_code: "[FEU]",
    property: "amount of fibrinogen broken down into the measured d-dimers",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "ELISA unit",
    symbol: nil,
    primary_code: "[ELU]",
    secondary_code: "[ELU]",
    property: "arbitrary ELISA unit",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "Ehrlich unit",
    symbol: nil,
    primary_code: "[EU]",
    secondary_code: "[EU]",
    property: "Ehrlich unit",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: false,
    special: false,
    arbitrary: true,
    classification: "chemical"
  )

  register(
    name: "neper",
    symbol: "Np",
    primary_code: "Np",
    secondary_code: "NEP",
    property: "level",
    scale: {
      function_code: "ln",
      value:         "1",
      unit:          "1",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel",
    symbol: "B",
    primary_code: "B",
    secondary_code: "B",
    property: "level",
    scale: {
      function_code: "lg",
      value:         "1",
      unit:          "1",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel sound pressure",
    symbol: "B(SPL)",
    primary_code: "B[SPL]",
    secondary_code: "B[SPL]",
    property: "pressure level",
    scale: {
      function_code: "two_lg",
      value:         "2",
      unit:          "10*-5.Pa",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel volt",
    symbol: "B(V)",
    primary_code: "B[V]",
    secondary_code: "B[V]",
    property: "electric potential level",
    scale: {
      function_code: "two_lg",
      value:         "1",
      unit:          "V",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel millivolt",
    symbol: "B(mV)",
    primary_code: "B[mV]",
    secondary_code: "B[MV]",
    property: "electric potential level",
    scale: {
      function_code: "two_lg",
      value:         "1",
      unit:          "mV",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel microvolt",
    symbol: "B(μV)",
    primary_code: "B[uV]",
    secondary_code: "B[UV]",
    property: "electric potential level",
    scale: {
      function_code: "two_lg",
      value:         "1",
      # TODO:: work out why it's not parsing "uV"
      unit: Unit.new(Term.new(Atom.find("V"), Prefix::Micro)),
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel 10 nanovolt",
    symbol: "B(10 nV)",
    primary_code: "B[10.nV]",
    secondary_code: "B[10.NV]",
    property: "electric potential level",
    scale: {
      function_code: "two_lg",
      value:         "10",
      unit:          "nV",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel watt",
    symbol: "B(W)",
    primary_code: "B[W]",
    secondary_code: "B[W]",
    property: "power level",
    scale: {
      function_code: "lg",
      value:         "1",
      unit:          "W",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "bel kilowatt",
    symbol: "B(kW)",
    primary_code: "B[kW]",
    secondary_code: "B[KW]",
    property: "power level",
    scale: {
      function_code: "lg",
      value:         "1",
      unit:          "kW",
    },
    metric: true,
    special: true,
    arbitrary: false,
    classification: "levels"
  )

  register(
    name: "stere",
    symbol: "st",
    primary_code: "st",
    secondary_code: "STR",
    property: "volume",
    scale: {
      value: "1",
      unit:  "m3",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "Ångström",
    symbol: "Å",
    primary_code: "Ao",
    secondary_code: "AO",
    property: "length",
    scale: {
      value: "0.1e0",
      unit:  "nm",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "barn",
    symbol: "b",
    primary_code: "b",
    secondary_code: "BRN",
    property: "action area",
    scale: {
      value: "100",
      unit:  "fm2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "technical atmosphere",
    symbol: "at",
    primary_code: "att",
    secondary_code: "ATT",
    property: "pressure",
    scale: {
      value: "1",
      unit:  "kgf/cm2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "mho",
    symbol: "mho",
    primary_code: "mho",
    secondary_code: "MHO",
    property: "electric conductance",
    scale: {
      value: "1",
      unit:  "S",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "pound per sqare inch",
    symbol: "psi",
    primary_code: "[psi]",
    secondary_code: "[PSI]",
    property: "pressure",
    scale: {
      value: "1",
      unit:  "[lbf_av]/[in_i]2",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "circle",
    symbol: "circ",
    primary_code: "circ",
    secondary_code: "CIRC",
    property: "plane angle",
    scale: {
      value: "2",
      unit:  "[pi].rad",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "spere",
    symbol: "sph",
    primary_code: "sph",
    secondary_code: "SPH",
    property: "solid angle",
    scale: {
      value: "4",
      unit:  "[pi].sr",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "metric carat",
    symbol: "ct<sub>m</sub>",
    primary_code: "[car_m]",
    secondary_code: "[CAR_M]",
    property: "mass",
    scale: {
      value: "0.2e0",
      unit:  "g",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "carat of gold alloys",
    symbol: "ct<sub><r>Au</r></sub>",
    primary_code: "[car_Au]",
    secondary_code: "[CAR_AU]",
    property: "mass fraction",
    scale: {
      value: "1",
      unit:  "/24",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "Smoot",
    symbol: nil,
    primary_code: "[smoot]",
    secondary_code: "[SMOOT]",
    property: "length",
    scale: {
      value: "67",
      unit:  "[in_i]",
    },
    metric: false,
    special: false,
    arbitrary: false,
    classification: "misc"
  )

  register(
    name: "bit",
    symbol: "bit<sub>s</sub>",
    primary_code: "bit_s",
    secondary_code: "BIT_S",
    property: "amount of information",
    scale: {
      function_code: "ld",
      value:         "1",
      unit:          "1",
    },
    metric: false,
    special: true,
    arbitrary: false,
    classification: "infotech"
  )

  register(
    name: "bit",
    symbol: "bit",
    primary_code: "bit",
    secondary_code: "BIT",
    property: "amount of information",
    scale: {
      value: "1",
      unit:  "1",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "infotech"
  )

  register(
    name: "byte",
    symbol: "B",
    primary_code: "By",
    secondary_code: "BY",
    property: "amount of information",
    scale: {
      value: "8",
      unit:  "bit",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "infotech"
  )

  register(
    name: "baud",
    symbol: "Bd",
    primary_code: "Bd",
    secondary_code: "BD",
    property: "signal transmission rate",
    scale: {
      value: "1",
      unit:  "/s",
    },
    metric: true,
    special: false,
    arbitrary: false,
    classification: "infotech"
  )
end
