import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);

export default class extends Controller {

  static values = {
    metricId: Number,
    metricValues: Array,
    metricLabels: Array
  }

  connect() {
    this.renderChart();
  }

  renderChart() {
    const ctx = this.element.getContext('2d');
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: this.metricLabelsValue,
        datasets: [{
          label: `Metric ${this.metricIdValue}`,
          data: this.metricValuesValue,
          backgroundColor: 'rgba(253, 16, 21, 0.2)',
          borderColor: 'rgba(253, 16, 21, 1)',
          borderWidth: 1,
          fill: false
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    })
  }

}

