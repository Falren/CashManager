import React from "react"
import PropTypes, { object } from "prop-types"
import moment from "moment"

class CashManager extends React.Component {
  render () {
    const monthlyCash = this.props.monthlyCash
    const initialCash = this.props.initialCash
    const cashIn = this.props.cashIn
    const cashOut = this.props.cashOut
    const monthlyCashIn = this.props.monthlyCashIn
    const monthlyCashOut = this.props.monthlyCashOut

    
    const mothlyRange =  new Array(12).fill(0);
   
    const months = moment.monthsShort().map((month, i) => { return <td key={i}>{month}</td> })
    
    const initRow = monthlyCash.map((_, i) => {
      return i == 0 ? <td key={i}>{initialCash}</td> : <td key={i}>{monthlyCash[i-1]}</td>
    });
    
    const cashInRow = (article, month) => {
      return monthlyCashIn[article] &&
      monthlyCashIn[article][month + 1]?.reduce((a, b) => a + (b.total || 0), 0);
    }
    
    const cashOutRow = (article, month) => {
      return monthlyCashOut[article] &&
      monthlyCashOut[article][month + 1]?.reduce((a, b) => a + (b.total || 0), 0);
    }
    
    function cashByType(cashType = object) { return mothlyRange.map((_val, index) => {
      return <td key={index}>{cashType[index + 1]}</td>
    })}
    const cashEnd = monthlyCash.map((_, i) => { return <td key={i}>{monthlyCash[i]}</td>})

    return (
      <React.Fragment>
        <table className='table'>
          <tbody>
            <tr className="table-secondary">
              <td colSpan='3'>Months</td>
              { months }
            </tr>
            <tr className="table-info">
              <td colSpan='3'>Initial cash</td>
              { initRow }
            </tr>
            <tr className="table-info">
              <td colSpan='3'>Cash in</td>
              { cashByType(cashIn) }
            </tr>
            {
              Object.keys(monthlyCashIn).map((key) => {
                return  <tr>
                          <td key={key} colSpan='3'>{key}</td>
                          { mothlyRange.map((_val, month) => {
                            return  <td key={month + key}>{cashInRow(key, month)}</td>
                          })}
                        </tr>
              })
            }   
            <tr className="table-info">
              <td colSpan='3'>Cash out</td>
              { cashByType(cashOut) }
            </tr>
            {
              Object.keys(monthlyCashOut).map((key) => {
                return  <tr>
                          <td key={key} colSpan='3'>{key}</td>
                          { mothlyRange.map((_val, month) => {
                            return  <td key={month + key}>{cashOutRow(key, month)}</td>
                          })}
                        </tr>
              })
            }
            <tr className='table-info'>
              <td colSpan='3'>Cash end</td>
              { cashEnd }
            </tr>
          </tbody>
        </table>
      </React.Fragment>
    );
  }
}

CashManager.propTypes = {
  initialCash: PropTypes.number,
  cashIn: PropTypes.object,
  cashOut: PropTypes.object,
  monthlyCashIn: PropTypes.object,
  monthlyCashOut: PropTypes.object,
  monthlyCash: PropTypes.array
};
export default CashManager
