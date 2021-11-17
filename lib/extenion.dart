extension Mydate on DateTime{
  DateTime  getDateOnly(){
    return DateTime(this.year,this.month,this.day);
  }
}