package Controller;

import DAO.GenuriMuzicaleDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.GenuriMuzicale;
import DAOImpl.GenuriMuzicaleDaoImpl;


public class GenuriMuzicaleController extends HttpServlet {

	GenuriMuzicale genmuzical = new GenuriMuzicale();
	GenuriMuzicaleDaoImpl genmuzicalDaoImpl = new GenuriMuzicaleDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaGenMuzical") != null) {
			String nume = request.getParameter("nume");
			String data_aparitie = request.getParameter("data_aparitie");
		    String tip = request.getParameter("tip");
			genmuzical.setNume(nume);
			genmuzical.setData_aparitie(data_aparitie);
			genmuzical.setTip(tip);
			if(nume != "" && data_aparitie!= "" && tip!= "") {
				genmuzicalDaoImpl.adaugaGenMuzical(genmuzical);
				List<GenuriMuzicale> listaGenuriMuzicale = new ArrayList();
				listaGenuriMuzicale = genmuzicalDaoImpl.afiseazaGenMuzical();
				request.setAttribute("listaGenuriMuzicale", listaGenuriMuzicale);
				RequestDispatcher rd = request.getRequestDispatcher("tabela_GenuriMuzicale.jsp");
				rd.forward(request, response);
			}
			else {
			RequestDispatcher rd = request.getRequestDispatcher("adauga_GenMuzical.jsp");
			rd.forward(request, response);
		}
	  }
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaGenMuzical") != null) {
			List<GenuriMuzicale> listaGenuriMuzicale = new ArrayList();
			listaGenuriMuzicale = genmuzicalDaoImpl.afiseazaGenMuzical();
			request.setAttribute("listaGenuriMuzicale", listaGenuriMuzicale);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_GenuriMuzicale.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaGenMuzical") != null) {
			long id1 = Long.parseLong(request.getParameter("idgen"));
			String nume = request.getParameter("nume");
			String data_aparitie = request.getParameter("data_aparitie");
			String tip = request.getParameter("tip");
			if(nume != "" && data_aparitie!= "" && tip!= "") {
				genmuzicalDaoImpl.modificaGenMuzical(id1, nume, data_aparitie, tip);
				List<GenuriMuzicale> listaGenuriMuzicale = new ArrayList();
				listaGenuriMuzicale = genmuzicalDaoImpl.afiseazaGenMuzical();
				request.setAttribute("listaGenuriMuzicale", listaGenuriMuzicale);
				RequestDispatcher rd = request.getRequestDispatcher("tabela_GenuriMuzicale.jsp");
				rd.forward(request, response);
			}
			else {
			
			RequestDispatcher rd = request.getRequestDispatcher("adauga_GenMuzical.jsp");
			rd.forward(request, response);
			}
		}

		if (request.getParameter("stergeGenMuzical") != null) {
			long id2 = Long.parseLong(request.getParameter("idgen"));
			genmuzical.setIdgen(id2);
			genmuzicalDaoImpl.stergeGenMuzical(genmuzical);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_GenMuzical.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}

