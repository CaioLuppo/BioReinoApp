package br.fmu.bioreino.model.componentes

import android.content.Context
import android.util.AttributeSet
import android.widget.Spinner
import androidx.appcompat.widget.AppCompatSpinner

class CategoriesSessionSpinner @JvmOverloads constructor(
    context: Context, attrs: AttributeSet? = null
) : AppCompatSpinner(context, attrs) {

    interface CategoriesSpinnerListener {
        fun aberturaPopUp(spinner: Spinner?)
        fun fechamentoPopUp(spinner: Spinner?)
    }

    var categoriesSpinnerListener: CategoriesSpinnerListener? = null
    private var aberto = false


    override fun performClick(): Boolean {
        aberto = true
        if (categoriesSpinnerListener != null) {
            categoriesSpinnerListener!!.aberturaPopUp(this)
        }
        return super.performClick()
    }

    override fun onWindowFocusChanged(hasWindowFocus: Boolean) {
        if (aberto && hasWindowFocus) {
            aberto = false
            if (categoriesSpinnerListener != null) {
                categoriesSpinnerListener!!.fechamentoPopUp(this)
            }
        }
        super.onWindowFocusChanged(hasWindowFocus)
    }
}