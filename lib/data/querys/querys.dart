class Querys {

  static const EXPENSES_BY_CATEGORY = 'SELECT categorie AS category, SUM(value) AS value FROM Expense WHERE strftime("%m", date) = :month and strftime("%Y", date) = :year GROUP BY categorie ';
}